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
    } else if (weatherSateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.pag';
    }
    return 'assets/images/clear.png';
  }
}
