import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

// ignore: must_be_immutable
class WeatherBody extends StatelessWidget {
  WeatherBody({
    super.key,
    required this.model,
  });
  WeatherModel model;

  String getDate(int date) {
    int hourNow;
    if (date > 12) {
      hourNow = date - 12;
    } else {
      hourNow = date;
    }

    return '$hourNow';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.city ?? '',
            style: const TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Update: ${getDate(model.update.hour)}:${model.update.minute}',
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${model.img}'),
              Text(
                model.avaTemp.toString(),
                style: const TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Column(
                children: [
                  Text(
                    "maxTemp: ${model.maxTemp}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "minTemp: ${model.minTemp}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            model.state ?? '',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
