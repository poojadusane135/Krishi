import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package

class WeatherCard extends StatefulWidget {
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  Map<String, dynamic>? _currentWeatherData; // Make it nullable
  List<dynamic>? _dailyWeatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiKey = '6a912f4a8b3db34fe53364cc2e95cd09'; // Replace with your API key
    final city = 'Jalgaon';
    final units = 'metric'; // You can change units to 'imperial' for Fahrenheit

    final currentWeatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=$units';
    final dailyWeatherUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=$units';

    final currentWeatherResponse = await http.get(Uri.parse(currentWeatherUrl));
    final dailyWeatherResponse = await http.get(Uri.parse(dailyWeatherUrl));

    if (currentWeatherResponse.statusCode == 200 &&
        dailyWeatherResponse.statusCode == 200) {
      setState(() {
        _currentWeatherData = jsonDecode(currentWeatherResponse.body);
        _dailyWeatherData = jsonDecode(dailyWeatherResponse.body)['list'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Method to get Lottie animation file based on weather description
  String _getLottieAnimation(String description) {
    if (description.toLowerCase().contains('clear')) {
      return 'assets/clear_sky.json';
    } else if (description.toLowerCase().contains('rain')) {
      return 'assets/rain.json';
    } else if (description.toLowerCase().contains('cloud')) {
      return 'assets/cloudy.json';
    } else {
      return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 252,
          color: Color(0xFF285429), // Custom color for the blue card
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20), // Add margin above city name
                    Text(
                      'Jalgaon',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    _currentWeatherData != null
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_currentWeatherData!['main']['temp']}°C',
                          style: TextStyle(color: Colors.white, fontSize: 33),
                        ),
                        Text(
                          '${_currentWeatherData!['weather'][0]['description']}',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          '${_currentWeatherData!['main']['humidity']}% Humidity',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )
                        : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(height: 3), // Reduce margin
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: _currentWeatherData != null
                    ? Container(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  height: 90,
                  width: 100,
                  child: Lottie.asset(
                    _getLottieAnimation('${_currentWeatherData!['weather'][0]['description']}'),
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(), // Return an empty container if _currentWeatherData is null
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xFF285429), // Custom color for the green card
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          padding: EdgeInsets.all(10),
          child: _dailyWeatherData != null
              ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dailyWeatherData!.length,
            itemBuilder: (context, index) {
              final weather = _dailyWeatherData![index];
              final DateTime date = DateTime.fromMillisecondsSinceEpoch(weather['dt'] * 1000);
              final String time = DateFormat('h:mm a').format(date);
              final int temperature = weather['main']['temp'].round();

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      time,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '$temperature°C',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              );
            },
          )
              : Container(), // Return an empty container if _dailyWeatherData is null
        ),
      ],
    );
  }
}
