import 'dart:convert';

import 'package:http/http.dart' as http;


import '../../models/forecast_model.dart';
import '../../models/temperature_trend_model.dart';
import '../../models/weather_model.dart';

class WeatherApiService {
  final String apiKey = 'YOUR_API_KEY';
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/';

  Future<WeatherModel> fetchWeatherByCity(String city) async {
    final response = await http.get(Uri.parse('${baseUrl}weather?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<WeatherModel> fetchWeatherByCoordinates(double lat, double lon) async {
    final response = await http.get(Uri.parse('${baseUrl}weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<ForecastModel>> fetchForecastByCity(String city) async {
    final response = await http.get(Uri.parse('${baseUrl}forecast?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      final List<dynamic> forecastList = jsonDecode(response.body)['list'];
      return forecastList.map((json) => ForecastModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<List<TemperatureTrendModel>> fetchTemperatureTrends(String city) async {
    final response = await http.get(Uri.parse('${baseUrl}forecast?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      final List<dynamic> trendList = jsonDecode(response.body)['list'];
      return trendList.map((json) => TemperatureTrendModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load temperature trend data');
    }
  }
}
