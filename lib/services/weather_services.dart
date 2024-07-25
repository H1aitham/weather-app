import 'package:http/http.dart' as http;

class WeatherServices {
  void getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=2cc019babc10409dbb5164407242407&q=London&aqi=no');
    http.Response response = await http.get(url);
  }
}
