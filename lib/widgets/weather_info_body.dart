import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
        Provider.of<WeatherProvider>(context).cityName!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/cloudy.png',
                ),
                 Text(
                  weatherData!.temp.toInt().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'maxTemp :${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                     'minTemp :${weatherData!.minTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherData!.weatherSateName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
