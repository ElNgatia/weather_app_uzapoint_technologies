import '../models/weather_model.dart';
import '../sources/remote/weather_api_service.dart';

class WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepository({required this.weatherApiService});

  Future<WeatherModel> fetvhWeatherByCity(String city) async {
    return await weatherApiService.fetchWeatherByCity(city);
  }

  Future<WeatherModel> fetchWeatherByCoordinates(double lat, double lon) async {
    return await weatherApiService.fetchWeatherByCoordinates(lat, lon);
  }
}
