import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "2cc019babc10409dbb5164407242407";
  void getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    String date = data['location']['localtime'];
    String temp = data['forecast']['forecastday'][0]['avgtemp_c'];
  }
}
