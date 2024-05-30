// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/weather_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    searchWeather(context, cityController.text);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void searchWeather(BuildContext context, String city) async {
  if (city.isNotEmpty) {
    await Provider.of<WeatherController>(context, listen: false)
        .getWeatherByCity(city);
    Navigator.pop(context);
  }
}
