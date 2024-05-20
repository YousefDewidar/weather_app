import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.weatherData);
  final WeatherModel weatherData;
}

class WeatherFailureState extends WeatherState {}






// Steps to Create Cubit

// create states
// عملنا فايل فيه كلاسات لكل صفحة او حاجه هتتغير 

// create cubit 
// عملنا فايل باسم الفولدر وضيفنا باكدج البلوك ونعمل كلاس داخل الملف يورث من كلاس اسمه كيوبت

// create function
// عشان احدد الحاله اللي عاوزها تشتغل emit()داخل كلاس الكيوبت نعمل فانكشن اللي بتجيب البيانات ونستخدم فيها 



// provide cubit
//  نشوف المنطقة اللي عاوز استخدم فيها البلوك عشان انشئ فيها اوبجيكت من الكيوبت نحددها من الشجرة 
// blocProvider نضع المنطقة اللي تحوي المكانين اللي هيحصل فيهم تغيير داخل ويدحيت اسمها 
// ننشئ اوبجت من الكيوبت داخل الودجيت دي

// integrate cubit
// بتاخد اسم الكيوبت والحالات بتوعه  blocBuilder<>بروح عند المكان اللي هيحصل فيه التغيير واستخدم 
// وبترجع الحالة المبعوته من الكيوبت دايما راميه ودنها


// trigger cubit
