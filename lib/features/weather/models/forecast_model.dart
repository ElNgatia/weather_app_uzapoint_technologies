class ForecastModel {
  final int date;
  final double temp;
  final String description;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final double wind;
  final int humidity;
  final int visibility;


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

  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['dt'],
      temp: json['main']['temp'],
      description: json['weather'][0]['description'],
      feelsLike: json['main']['feels_like'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
      visibility: json['visibility'],

    );
  }
}
