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
}
