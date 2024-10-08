import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "2cc019babc10409dbb5164407242407";
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;

    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

       weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
