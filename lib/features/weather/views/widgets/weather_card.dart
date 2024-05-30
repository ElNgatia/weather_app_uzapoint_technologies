// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final double temp;
  final double feelsLike;
  final String description;
  final String icon;

  const WeatherCard({
    super.key,
    required this.temp,
    required this.feelsLike,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final String iconUrl = 'http://openweathermap.org/img/wn/$icon@2x.png';
    return Container(
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
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${temp.toStringAsFixed(0)} °C',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Spacer(),
                Image.network(
                  iconUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Feels Like: ${feelsLike.toStringAsFixed(0)} °C / $description ',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
