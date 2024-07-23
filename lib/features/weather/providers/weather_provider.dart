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
        ChangeNotifierProvider<WeatherController>(
          create: (context) => WeatherController(
              weatherApiService: weatherApiService, locationService: locationService),
        ),
      ],
      child: child,
    );
  }
}
