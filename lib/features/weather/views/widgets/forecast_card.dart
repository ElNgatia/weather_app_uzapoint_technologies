// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final double tempMax;
  final double tempMin;
  final String date;
  final String time;
  final String description;
  final String icon;
  const ForecastCard({
    super.key,
    required this.tempMax,
    required this.tempMin,
    required this.date,
    required this.time,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final String iconUrl = 'http://openweathermap.org/img/wn/$icon@2x.png';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.only(right: 20),
      width: 125,
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(.2),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date.toString(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            time.toString(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Image.network(
            iconUrl,
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${tempMax.toStringAsFixed(0)}°',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '/',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Text(
                '${tempMin.toStringAsFixed(0)}°',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
