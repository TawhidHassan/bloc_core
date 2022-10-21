
import 'dart:convert';
import 'package:bloc_practice/weather.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;



class WeatherAPIClient {
  static const baseUrl =
      'http://api.openweathermap.org/data/2.5/weather?appid=8598c1b0b4e91b68974101d97a10552b&q=Hyderabad';


  Future<Weather> getWeather(String city) async {
    print("call api");
    final locationUrl = '$baseUrl&q=$city';
    final locationResponse = await http.get(Uri.parse(locationUrl));
    print(jsonDecode(locationResponse.body));
    if (locationResponse.statusCode != 200) {
      throw Exception('Error getting weather info');
    }

    final weatherJson = jsonDecode(locationResponse.body);
    return Weather.fromJson(weatherJson);
  }
}