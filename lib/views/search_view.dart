import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/services/weather_services.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context);
              BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text('Search'),
              hintText: 'Enter The City',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 1,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            ),
          ),
        ),
      ),
    );
  }
}
