// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app_uza_technologies/features/weather/models/weather_model.dart';
import 'package:weather_app_uza_technologies/features/weather/services/weather_api_service.dart';

import '../services/location_service.dart';

class WeatherController extends ChangeNotifier {
  final LocationService locationService;
  final WeatherApiService weatherApiService;

  WeatherController({
    required this.weatherApiService, 
    required this.locationService,
  });

  WeatherModel? _weather;

  WeatherModel? get weather => _weather;
  bool _loading = false;
  bool get loading => _loading;
  String? _error;
  String? get error => _error;

  Future<void> getWeatherByCity(String city) async {
    _loading = true;
    notifyListeners();
    try {
      _weather = await weatherApiService.fetchWeatherByCity(city);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getWeatherByLocation() async {
    _loading = true;
    notifyListeners();

    try {
      final position = await locationService.getCurrentLocation();
      _weather =
          await weatherApiService.fetchWeatherByCoordinates(position.latitude, position.longitude);
      _error = null;
    } catch (error) {
      _error = error.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
