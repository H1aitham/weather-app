import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherSateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherSateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherSateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'tem=$temp minTemp=$minTemp date=$date';
  }

  String getImage() {
    if (weatherSateName == 'Clear' || weatherSateName == 'Light Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherSateName == 'Sleet' ||
        weatherSateName == 'Snow' ||
        weatherSateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherSateName == 'Heavy Cloud') {
      return 'assets/images/cloud.png';
    } else if (weatherSateName == 'Light Rain' ||
        weatherSateName == 'Heavy Rain' ||
        weatherSateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherSateName == 'Thunderstorm' ||
        weatherSateName == 'Thunder') {
      return 'assets/images/thunderstorm.pag';
    }
    return 'assets/images/clear.png';
  }

  MaterialColor getThemeColor() {
    if (weatherSateName == 'Clear' || weatherSateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherSateName == 'Sleet' ||
        weatherSateName == 'Snow' ||
        weatherSateName == 'Hail') {
      return Colors.blue;
    } else if (weatherSateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherSateName == 'Light Rain' ||
        weatherSateName == 'Heavy Rain' ||
        weatherSateName == 'Showers') {
      return Colors.blue;
    } else if (weatherSateName == 'Thunderstorm' ||
        weatherSateName == 'Thunder') {
      return Colors.blue;
    } else if (weatherSateName == 'Sunny') {
      return Colors.orange;
    }
    return Colors.green;
  }
}
