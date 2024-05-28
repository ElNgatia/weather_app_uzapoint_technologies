import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/repositories/weather_repository.dart';

import '../domain/repository/weather_repository.dart';
import '../data/sources/remote/location_service.dart';
import '../data/sources/remote/weather_api_service.dart';
import '../domain/usecases/fetch_temperature_trends.dart';
import '../domain/usecases/fetch_weather_by_city.dart';
import '../domain/usecases/fetch_weather_by_location.dart';
import '../presentation/controllers/weather_controller.dart';

class WeatherProvider extends StatelessWidget {
  final Widget child;

  const WeatherProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherApiService>(create: (_) => WeatherApiService()),
        Provider<LocationService>(create: (_) => LocationService()),
        Provider<WeatherRepositoryImpl>(
          create: (context) => WeatherRepositoryImpl(
              weatherApiService:
                  Provider.of<WeatherApiService>(context, listen: false)),
        ),
        ChangeNotifierProvider<WeatherController>(
          create: (context) => WeatherController(
            fetchWeatherByCity: FetchWeatherByCity(
              Provider.of<WeatherRepository>(context, listen: false),
            ),
            fetchWeatherByLocation: FetchWeatherByLocation(
              Provider.of<WeatherRepository>(context, listen: false),
            ),
            fetchTemperatureTrends: FetchTemperatureTrends(
              Provider.of<WeatherRepository>(context, listen: false),
            ),
            locationService:
                Provider.of<LocationService>(context, listen: false),
          ),
        ),
      ],
      child: child,
    );
  }
}
