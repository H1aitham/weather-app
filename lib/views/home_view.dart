import 'package:flutter/material.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return  SearchPage();
                },
              ));
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body:  const NoWeatherBody(),
    );
  }
}
