
import '../entities/weather.dart';
import '../repository/weather_repository.dart';

class FetchWeatherByCity {
  final WeatherRepository repository;

  FetchWeatherByCity(this.repository);

  Future<Weather> call(String city) async {
    return await repository.fetchWeatherByCity(city);
  }
}