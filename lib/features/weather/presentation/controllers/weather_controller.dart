// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../data/sources/remote/location_service.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/fetch_temperature_trends.dart';
import '../../domain/usecases/fetch_weather_by_city.dart';
import '../../domain/usecases/fetch_weather_by_location.dart';

class WeatherController extends ChangeNotifier {
  final FetchWeatherByCity fetchWeatherByCity;
  final FetchWeatherByLocation fetchWeatherByLocation;
  final FetchTemperatureTrends fetchTemperatureTrends;
  final LocationService locationService;

  WeatherController({
    required this.fetchWeatherByCity,
    required this.fetchWeatherByLocation,
    required this.fetchTemperatureTrends,
    required this.locationService,
  });

  Weather? _weather;

  Weather? get weather => _weather;
  bool _loading = false;
  bool get loading => _loading;
  String? _error;
  String? get error => _error;

  Future<void> getWeatherByCity(String city) async {
    _loading = true;
    notifyListeners();
    try {
      _weather = await fetchWeatherByCity(city);
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
          await fetchWeatherByLocation(position.latitude, position.longitude);
      _error = null;
    } catch (error) {
      _error = error.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }


}
