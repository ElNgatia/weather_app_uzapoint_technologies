class WeatherModel {
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;

  WeatherModel({
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      pressure: json['main']['pressure'],
    );
  }
}
