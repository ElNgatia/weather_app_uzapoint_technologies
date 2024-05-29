import 'package:flutter/material.dart';

import 'weather_info_item.dart';

class MoreForecastInformation extends StatelessWidget {
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int visibility;

  const MoreForecastInformation({
    super.key,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.lightBlue,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              WeatherInfoItem(
                icon: Icons.water_drop,
                label: 'Humidity',
                value: '$humidity%',
              ),
              WeatherInfoItem(
                icon: Icons.compress,
                label: 'Pressure',
                value: '$pressure hPa',
              ),
              WeatherInfoItem(
                icon: Icons.air,
                label: 'Wind',
                value: '$windSpeed m/s',
              ),
              WeatherInfoItem(
                icon: Icons.visibility,
                label: 'Visibility',
                value: '${visibility / 1000} km',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
