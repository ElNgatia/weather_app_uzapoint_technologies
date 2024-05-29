import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/weather_controller.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch weather data for the current location when the screen is initialized
    Provider.of<WeatherController>(context, listen: false).getWeatherByLocation();
  }
  @override
  Widget build(BuildContext context) {
    final weatherController = Provider.of<WeatherController>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Weather',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            if (weatherController.loading)
              const CircularProgressIndicator()
            else
              Text(
                weatherController.weather?.description.toString() ?? 'No data available',
                style: Theme.of(context).textTheme.displaySmall,
              ),
          ],
        ),
      ),
    );
  }
}
