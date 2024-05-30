import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controllers/weather_controller.dart';
import '../models/forecast_model.dart';
import '../views/widgets/forecast_card.dart';
import 'widgets/more_forecast_information.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late Future<void> _forecastFuture;
  ForecastModel? selectedForecast;

  @override
  void initState() {
    super.initState();
    _forecastFuture = _fetchForecast();
  }

  Future<void> _fetchForecast() async {
    await Provider.of<WeatherController>(context, listen: false)
        .getForecastByCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _forecastFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('An error occurred: ${snapshot.error}'),
                );
              } else {
                Provider.of<WeatherController>(context);
                return Consumer<WeatherController>(
                  builder: (context, weatherController, child) {
                    if (weatherController.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (weatherController.error != null) {
                      return Center(
                          child: Text(
                              '${weatherController.error}'));
                    } else if (weatherController.forecast == null) {
                      return const Center(
                          child: Text('No forecast data available'));
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '5 Day Forecast',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 170,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: weatherController.forecast.length,
                              itemBuilder: (context, index) {
                                final forecast =
                                    weatherController.forecast[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedForecast = forecast;
                                    });
                                  },
                                  child: ForecastCard(
                                    time: DateFormat.Hm().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            (forecast!.date * 1000))),
                                    date: DateFormat.yMd().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            forecast.date * 1000)),
                                    tempMax: forecast.tempMax,
                                    tempMin: forecast.tempMin,
                                    description: forecast.description,
                                    icon: forecast.icon,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (selectedForecast != null)
                            MoreForecastInformation(
                              pressure: selectedForecast!.pressure,
                              humidity: selectedForecast!.humidity,
                              windSpeed: selectedForecast!.wind,
                              visibility: selectedForecast!.visibility,
                            ),
                          if (selectedForecast == null)
                            MoreForecastInformation(
                                pressure: weatherController.weather!.pressure,
                                humidity: weatherController.weather!.humidity,
                                windSpeed: weatherController.weather!.wind,
                                visibility:
                                    weatherController.weather!.visibility)
                        ],
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
