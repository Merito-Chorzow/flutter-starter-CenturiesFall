import 'package:flutter/material.dart';
import 'package:geo_journal/models/weather_model.dart';
import 'package:geo_journal/services/weather_service.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('7679f16884822c358e3c6b7a6299a505');
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/Clouds.json';
      case 'fog':
        return 'assets/Clouds.json';
      case 'rain':
        return 'assets/Weather-partly shower.json';
      case 'shower rain':
        return 'assets/Weather-partly shower.json';
      case 'thunderstorm':
        return 'assets/Weather-storm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "Wczytywanie miasta..."),

            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            Text('${_weather?.temperature.round()}°C'),

            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}
