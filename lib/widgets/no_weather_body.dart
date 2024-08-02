import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
WeatherModel? weatherData;
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  
  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
      body: weatherData == null
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
            )
          : const WeatherInfoBody(),
    );
  }
}
