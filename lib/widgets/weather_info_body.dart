import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key, required this.weatherModel,

  });
final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherModel.cityName,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
        ),
        Text(
          ('updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}'),
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(weatherModel.weatherIcon.contains('https:')
                ? weatherModel.weatherIcon
                : 'https:${weatherModel.weatherIcon}'),
            Text(
              weatherModel.temp.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: [
                Text(
                  'max: ${weatherModel.maxTemp.round()}',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  'min: ${weatherModel.minTemp.round()}',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          weatherModel.weatherCondition,
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// d 3shan a7wl el formatting String l DateTime
// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }
