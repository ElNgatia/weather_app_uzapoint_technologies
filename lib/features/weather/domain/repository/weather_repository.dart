import '../entities/temperature_trend.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeatherByCity(String city);
  Future<Weather> fetchWeatherByCoordinates(double lat, double lon);
  Future<List<Weather>> fetchForecastByCity(String city);
  Future<List<TemperatureTrend>> fetchTemperatureTrends(String city);
}