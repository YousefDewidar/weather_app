import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather-cubit/get_weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
//  <WeatherState> عشان اعرف الكيوبت اننا بتعامل مع الحالات دي

  WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required cityName}) async {
    try {
      weatherModel = await WeatherApi().getData(c: cityName);

      emit(WeatherLoadedState(weatherModel!));
      // عشان بعد مالبيانات تتحمل يبعت للكيووبت الحالة اللي انا عاوزها
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
