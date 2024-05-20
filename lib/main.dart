import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather-cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather-cubit/get_weather_state.dart';
import 'package:weather_app/pages/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  MaterialColor getThemeColor(String? dayDescription) {
    switch (dayDescription) {
      case 'Sunny':
        return Colors.yellow;
      case 'Partly cloudy':
        return Colors.lightBlue;
      case 'Cloudy':
        return Colors.grey;
      case 'Overcast':
        return Colors.grey;
      case 'Mist':
        return Colors.grey;
      case 'Patchy rain possible':
        return Colors.lightBlue;
      case 'Patchy snow possible':
        return Colors.lightBlue;
      case 'Patchy sleet possible':
        return Colors.lightBlue;
      case 'Patchy freezing drizzle possible':
        return Colors.lightBlue;
      case 'Thundery outbreaks possible':
        return Colors.amber;
      case 'Blowing snow':
        return Colors.lightBlue;
      case 'Blizzard':
        return Colors.blue;
      case 'Fog':
        return Colors.grey;
      case 'Freezing fog':
        return Colors.grey;
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing drizzle':
        return Colors.lightBlue;
      case 'Heavy freezing drizzle':
        return Colors.lightBlue;
      case 'Patchy light rain':
      case 'Light rain':
        return Colors.lightBlue;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch:
                  getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.state,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          ),
        ));
  }
}
