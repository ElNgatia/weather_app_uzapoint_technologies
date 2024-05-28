import '../entities/weather.dart';
import '../repository/weather_repository.dart';

class FetchWeatherByLocation {
  final WeatherRepository repository;

  FetchWeatherByLocation(this.repository);

  Future<Weather> call(double lat, double lon) async {
    return await repository.fetchWeatherByCoordinates(lat, lon);
  }
}