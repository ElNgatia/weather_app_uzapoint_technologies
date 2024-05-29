import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/weather_controller.dart';
import '../services/location_service.dart';
import '../services/weather_api_service.dart';

class WeatherProvider extends StatelessWidget {
  final Widget child;

  const WeatherProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherApiService>(create: (_) => WeatherApiService()),
        Provider<LocationService>(create: (_) => LocationService()),
        ChangeNotifierProvider<WeatherController>(
          create: (context) => WeatherController(
              weatherApiService:
                  Provider.of<WeatherApiService>(context, listen: false),
              locationService:
                  Provider.of<LocationService>(context, listen: false)),
        ),
      ],
      child: child,
    );
  }
}
