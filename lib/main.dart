import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/views/home_page.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: getThemeColor(context
                        .read<GetWeatherCubit>()
                        .weatherModel
                        ?.weatherCondition),
                  ),
                  appBarTheme: AppBarTheme(
                      backgroundColor: getThemeColor(
                        context
                            .read<GetWeatherCubit>()
                            .weatherModel
                            ?.weatherCondition,
                      ),
                      foregroundColor: Colors.white),
                ),
                home: const HomePage(),
              );
            },
          );
        });
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue; // Default color
  }

  switch (condition) {
    case "Sunny":
      //case "Clear":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.orange;
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.lightBlue;
    case "Patchy rain possible":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
      return Colors.blue;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Moderate or heavy freezing rain":
      return Colors.teal;
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Light snow showers":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Moderate or heavy snow showers":
      return Colors.indigo;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.blueGrey;
    case "Blowing snow":
    case "Blizzard":
      return Colors.indigo;
    case "Patchy freezing drizzle possible":
      return Colors.cyan;
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.blueGrey;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.red;
    default:
      return Colors.lightBlue;
  }
}

// class CustomMaterialApp extends StatelessWidget {
//   const CustomMaterialApp({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
//             .weatherModel?.weatherCondition),
//       ),
//       home: HomePage(),
//     );
//   }
// }

// ana leh hena 3mlt extract widget le el material app
// d 3shan a3rf at5dm el cubit bta3
// 3shan el GetWeatherCubit bytshaf f context el gya b3deh w nta nazl w f el 7ala
// el abl ma a3ml extract le el material app kan el context el hya f abl
// el GetWeatherCubit bta3y

//theme: ThemeData.dark(),
//d kda named constructor mn el themeData by8yr kema w7da bs w hya el brightness
// y3ni ana kan mmkn a3ml kda ThemeData(brightness: Brightness.dark) w hya hya
// nfs el klam el light

// primary swatch w d el attribute el mn 5lalo t2dr t8yr loun el ttbe2 bta3k
// w bya5od material color

// a hya el material color => d btb2a map mn el colors bta5od feha el color
// w el shade bta3to
// w byb2a feha 7aga esmha el primary color w d b2a lazmto a
// el primary color d el loun el byt7t lma tst5dm material color f 7aga bta5od
// color w 5ly balk hena
// 3shan mynf3sh material color ya5od color lakn ynf3 color ya5od material color
