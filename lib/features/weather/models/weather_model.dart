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
    );
  }

  WeatherModel toEntity() {
    return WeatherModel(
      description: description,
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      place: place,
      wind: wind,
      humidity: humidity,
      visibility: visibility,
      sunset: sunset,
      sunrise: sunrise,
    );
  }
}
