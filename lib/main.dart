import 'package:flutter/material.dart';
import 'package:weather_app_uza_technologies/features/weather/views/weather_scaffold.dart';
import 'package:weather_app_uza_technologies/features/weather/providers/weather_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WeatherProvider(
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherHomeScreen(),
      ),
    );
  }
}

