import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather-cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7A74A),
        elevation: 0,
        title: const Text(
          "Search a City",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(229, 246, 246, 246),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 192, 120, 19)),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                focusedBorder: const OutlineInputBorder(),
                hintText: 'Enter City Name',
                label: const Text('Search'),
                labelStyle: const TextStyle(color: Color(0xffF7A74A)),
                suffixIconColor: const Color(0xffF7A74A),
                focusColor: Colors.black,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    var gg = BlocProvider.of<GetWeatherCubit>(context);
                    gg.getWeather(cityName: mycontroller.text);
                    Navigator.pop(context);
                  },
                ),
              )),
        ),
      ),
    );
  }
}
