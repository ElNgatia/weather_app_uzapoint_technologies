import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeatherByCity(String city);
  Future<Weather> fetchWeatherByCoordinates(double lat, double lon);
}