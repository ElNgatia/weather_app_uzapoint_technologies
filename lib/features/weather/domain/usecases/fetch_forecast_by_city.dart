import 'package:weather_app_uza_technologies/features/weather/domain/entities/weather.dart';

import '../repository/weather_repository.dart';

class FetchForecastByCity {
  final WeatherRepository repository;

  FetchForecastByCity(this.repository);

  Future<List<Weather>> call(String city) async {
    return await repository.fetchForecastByCity(city);
  }
}
