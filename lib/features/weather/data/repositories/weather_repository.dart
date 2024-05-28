import '../models/forecast_model.dart';
import '../models/temperature_trend_model.dart';
import '../models/weather_model.dart';
import '../sources/remote/weather_api_service.dart';

class WeatherRepositoryImpl {
  final WeatherApiService weatherApiService;

  WeatherRepositoryImpl({required this.weatherApiService});

  Future<WeatherModel> fetchWeatherByCity(String city) async {
    return await weatherApiService.fetchWeatherByCity(city);
  }

  Future<WeatherModel> fetchWeatherByCoordinates(double lat, double lon) async {
    return await weatherApiService.fetchWeatherByCoordinates(lat, lon);
  }

  Future<List<ForecastModel>> fetchForecastByCity(String city) async {
    return await weatherApiService.fetchForecastByCity(city);
  }

  Future<List<TemperatureTrendModel>> fetchTemperatureTrends(
      String city) async {
    return await weatherApiService.fetchTemperatureTrends(city);
  }
}
