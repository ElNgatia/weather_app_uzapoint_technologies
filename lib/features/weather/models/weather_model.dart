class WeatherModel {
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final String place;
  final double wind;
  final int humidity;
  final int visibility;
  final int sunset;
  final int sunrise;
  final String icon;

  WeatherModel({
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.place,
    required this.wind,
    required this.humidity,
    required this.visibility,
    required this.sunset,
    required this.sunrise,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      pressure: json['main']['pressure'],
      place: json['name'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
      visibility: json['visibility'],
      sunset: json['sys']['sunset'],
      sunrise: json['sys']['sunrise'],
      icon: json['weather'][0]['icon'],
    );
  }
}
