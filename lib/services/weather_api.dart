import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherApi {
  WeatherApi();
  final dio = Dio();

  Future<WeatherModel> getData({required String c}) async {
    Response response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json?key=b8e79497f6694d25bee234721241603&q=$c');

    Map<String, dynamic> jsonData = response.data;

    return WeatherModel(
      update: DateTime.parse(jsonData["current"]["last_updated"]),
      city: jsonData["location"]["name"],
      img:jsonData["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      state: jsonData["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      minTemp: jsonData["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: jsonData["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      avaTemp: jsonData["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
    );
  
  }
}
