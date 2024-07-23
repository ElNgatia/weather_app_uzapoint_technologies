import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/forecast_model.dart';
import '../models/weather_model.dart';

class WeatherApiService {
  final String apiKey = dotenv.env['WEATHER_API_KEY']!;
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/';

  Future<WeatherModel> fetchWeatherByCoordinates(double lat, double lon) async {
    final response =
        await http.get(Uri.parse('${baseUrl}weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<ForecastModel>> fetchForecastByCoordinates(double lat, double lon) async {
    final response = await http
        .get(Uri.parse('${baseUrl}forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      final List<dynamic> forecastList = jsonDecode(response.body)['list'];

      return forecastList.map((json) => ForecastModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<WeatherModel> fetchWeatherByCity(String city) async {
    final response =
        await http.get(Uri.parse('${baseUrl}weather?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<ForecastModel>> fetchForecastByCity(String city) async {
    final response =
        await http.get(Uri.parse('${baseUrl}forecast?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      final List<dynamic> forecastList = jsonDecode(response.body)['list'];
      return forecastList.map((json) => ForecastModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}

WeatherApiService weatherApiService = WeatherApiService();