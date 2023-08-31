import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:wether_app/model_class/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '4d7a9128b46867784bd68ae8ef53e4d5',
      'units': 'imperial'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    if (kDebugMode) {
      print(response.body);
    }
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
