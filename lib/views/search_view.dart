import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherModel = context.read<GetWeatherCubit>().weatherModel;
    final themeColor = getThemeColor(weatherModel?.weatherCondition);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeColor,
            themeColor[300] ?? themeColor,
            themeColor[50] ?? themeColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                await BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                label: Text('Search'),
                hintText: 'Enter The City',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
