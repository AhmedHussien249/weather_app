class WeatherModel {
  final String cityName;
  final String date;
  final num temp, minTemp, maxTemp;
  final String weatherCondition;
  final String weatherIcon;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition,
      required this.weatherIcon});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      weatherIcon: json['forecast']['forecastday'][0]['day']['condition']
          ['icon'],
    );
  }
}
