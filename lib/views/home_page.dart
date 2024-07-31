import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.white, // This changes the color of the back button
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;

              WeatherServices services = WeatherServices();
              WeatherModel weather =
                  await services.getWeather(cityName: cityName!);
              print(weather);
            },
            decoration: InputDecoration(
              label: const Text(
                "Search",
                style: TextStyle(color: Colors.orange),
              ),
              contentPadding: const EdgeInsets.all(40),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffix: const Icon(Icons.search, color: Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}
