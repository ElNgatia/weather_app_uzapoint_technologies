class Forecast {
  final DateTime dateTime;
  final String condition;
  final double temperature;
  final double windSpeed;
  final int humidity;

  Forecast({
    required this.dateTime,
    required this.condition,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
  });
}
