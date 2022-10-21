import 'dart:async';
import 'package:bloc_practice/weather.dart';
import 'package:bloc_practice/weatherAPIClient.dart';
import 'package:meta/meta.dart';

class WeatherRepository {
   WeatherAPIClient? weatherAPIClient=WeatherAPIClient();

  Future<Weather> getWeather(String city) {
    return weatherAPIClient!.getWeather(city);
  }
}