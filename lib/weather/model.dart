import 'dart:convert';

WeatherModel initialChatFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String initialChatToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  final double currentTemperature;
  final String weatherDescription;
  final double humidityLevel;

  WeatherModel({
    required this.currentTemperature,
    required this.weatherDescription,
    required this.humidityLevel,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        currentTemperature: json["Current temperature"],
        weatherDescription: json["Weather description"],
        humidityLevel: json["Humidity level"],
      );

  Map<String, dynamic> toJson() => {
        "Current temperature": currentTemperature,
        "Weather description": weatherDescription,
        "Humidity level": humidityLevel,
      };
}
