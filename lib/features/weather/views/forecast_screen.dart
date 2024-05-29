import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_uza_technologies/features/weather/views/widgets/forecast_card.dart';

import '../controllers/weather_controller.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late Future<void> _forecastFuture;

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
                              'An error occurred: ${weatherController.error}'));
                    } else if (weatherController.forecast == null) {
                      return const Center(
                          child: Text('No forecast data available'));
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Forecast',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: weatherController.forecast.length,
                              itemBuilder: (context, index) {
                                final forecast =
                                    weatherController.forecast[index];
                                return ForecastCard(
                                  time: DateFormat.Hm().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          forecast!.date * 1000)),
                                  date: DateFormat.yMd().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          forecast.date * 1000)),
                                  tempMax: forecast.tempMax,
                                  tempMin: forecast.tempMin,
                                );
                              },
                            ),
                          ),
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
