import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_uza_technologies/features/weather/views/widgets/more_information.dart';
import 'package:weather_app_uza_technologies/features/weather/views/widgets/weather_card.dart';

import '../controllers/weather_controller.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  State<CurrentWeatherScreen> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  late Future<void> _weatherFuture;

  @override
  void initState() {
    super.initState();
     _weatherFuture =  _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    await Provider.of<WeatherController>(context, listen: false).getWeatherByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _weatherFuture,
            builder: (context, snapshot) {
                return Consumer<WeatherController>(
                  builder: (context, weatherController, child) {
                    if (weatherController.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (weatherController.error != null) {
                      return Center(child: Text('${weatherController.error}'));
                    } else if (weatherController.weather == null) {
                      return const Center(child: Text('No weather data available'));
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Here\'s the weather in ${weatherController.weather!.place}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          if (weatherController.loading)
                            const CircularProgressIndicator()
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WeatherCard(
                                  temp: weatherController.weather!.temp,
                                  feelsLike: weatherController.weather!.feelsLike,
                                  description: weatherController.weather!.description,
                                  icon: weatherController.weather!.icon,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Current conditions',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                MoreWeatherInformation(
                                  pressure: weatherController.weather!.pressure,
                                  humidity: weatherController.weather!.humidity,
                                  windSpeed: weatherController.weather!.wind,
                                  visibility: weatherController.weather!.visibility,
                                  sunrise: weatherController.weather!.sunrise,
                                  sunset: weatherController.weather!.sunset,
                                )
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                );
              }
        )
      ),
    );
  }
}
