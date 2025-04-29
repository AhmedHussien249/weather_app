import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
      print(weatherModel!.weatherCondition);
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
// lw ana 3ndy tash3ob f el widget w f custom widgets kteer
// fa d hy5li f tash3ob f el tree w nta nazl
// sa3tha mwdo3 en ana abasy el model f el state d
// hyb2a morhk gdn l2ny hfdl apassy el model f kol custom widget
// f el 7al en ana a3rf el model bta3y f el cubit kolo
// w a3rf el model mn 5las :
// BlocProvider.of<GetWeatherCubit>(context).weatherModel
