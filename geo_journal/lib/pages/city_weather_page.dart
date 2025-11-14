import 'package:flutter/material.dart';
import 'package:geo_journal/models/weather_model.dart';
import 'package:geo_journal/services/weather_service.dart';
import 'package:lottie/lottie.dart';

class CityWeatherPage extends StatefulWidget {
  const CityWeatherPage({super.key});

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  final _weatherService = WeatherService('7679f16884822c358e3c6b7a6299a505');
  Weather? _weather;
  String _selectedCity = 'Warszawa';
  bool _isLoadingCurrentLocation = false;

  final List<String> cities = [
    'Warszawa',
    'Kraków',
    'Wrocław',
    'Poznań',
    'Gdańsk',
    'Szczecin',
    'Łódź',
    'Gdynia',
  ];

  _fetchWeather(String cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Nie udało się pobrać pogody')));
    }
  }

  _fetchCurrentLocationWeather() async {
    setState(() {
      _isLoadingCurrentLocation = true;
    });

    try {
      String cityName = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        _isLoadingCurrentLocation = false;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nie udało się pobrać aktualnej lokalizacji')),
      );
      setState(() {
        _isLoadingCurrentLocation = false;
      });
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
    _fetchWeather(_selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pogoda w mieście'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                value: _selectedCity,
                isExpanded: true,
                items: cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                    _fetchWeather(newValue);
                  }
                },
              ),
            ),
            Text(_weather?.cityName ?? "Wczytywanie..."),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text('${_weather?.temperature.round()}°C'),
            Text(_weather?.mainCondition ?? ""),
            SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _isLoadingCurrentLocation
                  ? null
                  : _fetchCurrentLocationWeather,
              icon: _isLoadingCurrentLocation
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(Icons.location_on),
              label: Text(
                _isLoadingCurrentLocation
                    ? 'Wczytywanie...'
                    : 'Moja lokalizacja',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
