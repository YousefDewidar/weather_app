class WeatherModel {
  double? minTemp;
  double? maxTemp;
  double? avaTemp;
  String? state;
  String? city;
  String? img;
  DateTime update;


  WeatherModel({
    required this.city,
    required this.state,
    required this.minTemp,
    required this.maxTemp,
    required this.avaTemp,
    required this.update,
    required this.img,
  });
}
