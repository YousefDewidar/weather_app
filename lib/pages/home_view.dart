import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather-cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather-cubit/get_weather_state.dart';
import 'package:weather_app/pages/no_weather_body.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5,
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // علامة البحث ف الشاشة الرئيسية
          IconButton(
            onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));

              setState(() {});
            },
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(231, 245, 240, 240),
            iconSize: 26.0,
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherBody(
              model: state.weatherData,
            );
          } else {
            return const Text('oops there was an error');
          }
        },
      ),
    );
  }
}
