import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "2cc019babc10409dbb5164407242407";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    var jsonData = data['forecast']['forecastday'][0];

    WeatherModel weather = WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['maxtemp_c'],
      weatherSateName: jsonData['condition']['text'],
    );
    return weather;
  }
}
