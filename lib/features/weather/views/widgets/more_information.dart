// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'weather_info_item.dart';

class MoreWeatherInformation extends StatelessWidget {
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int visibility;
  final int sunrise;
  final int sunset;
  const MoreWeatherInformation({
    super.key,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.sunrise,
    required this.sunset,
  });

  @override
  Widget build(BuildContext context) {
    final sunriseTime = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(sunrise * 1000));
    final sunsetTime = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(sunset * 1000));
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
          padding: const EdgeInsets.all(6),
          child: GridView.count(
            crossAxisCount: 3,
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
              WeatherInfoItem(
                icon: Icons.wb_sunny,
                label: 'Sunrise',
                value: sunriseTime,
              ),
              WeatherInfoItem(
                icon: Icons.nights_stay,
                label: 'Sunset',
                value: sunsetTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
