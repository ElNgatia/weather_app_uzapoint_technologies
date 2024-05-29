class TemperatureTrendModel {
  final DateTime date;
  final double temp;

  TemperatureTrendModel({
    required this.date,
    required this.temp,
  });

  factory TemperatureTrendModel.fromJson(Map<String, dynamic> json) {
    return TemperatureTrendModel(
      date: DateTime.parse(json['date']),
      temp: json['temp'],
    );
  }
}
