class ForecastModel {
  final String date;
  final String day;
  final String temp;
  final String description;

  ForecastModel({
    required this.date,
    required this.day,
    required this.temp,
    required this.description,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['date'],
      day: json['day'],
      temp: json['temp'],
      description: json['description'],
    );
  }
}
