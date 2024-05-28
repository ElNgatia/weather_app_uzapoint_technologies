import '../entities/temperature_trend.dart';
import '../repository/weather_repository.dart';

class FetchTemperatureTrends {
  final WeatherRepository repository;

  FetchTemperatureTrends(this.repository);

  Future<List<TemperatureTrend>> call(String city) async {
    return await repository.fetchTemperatureTrends(city);
  }
}
