class ForecastModel {
  final String icon;
  final String description;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double wind;
  final double temp;
  final int date;
  final int humidity;
  final int visibility;
  final int pressure;

  ForecastModel({
    required this.date,
    required this.temp,
    required this.description,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.wind,
    required this.humidity,
    required this.visibility,
    required this.icon,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['dt'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'].toDouble(),
      visibility: json['visibility'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
