import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wheather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '7e33cc8dfc1c4982ac6171336252604';

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there something error try again';
      log(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('An error occurred while fetching weather data');
    }
  }
}
