class WeatherModel {
  String date;
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
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['minTemp'],
        weatherSateName: jsonData['condition']['text']);
  }
}
