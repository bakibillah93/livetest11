import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatefulWidget {
  @override
  _WeatherInfoAppState createState() => _WeatherInfoAppState();
}

class _WeatherInfoAppState extends State<WeatherInfoApp> {
  List<Map<String, dynamic>> citiesWeatherData = [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5,
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8,
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2,
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0,
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
        ),
        body: ListView.builder(
          itemCount: citiesWeatherData.length,
          itemBuilder: (context, index) {
            final cityData = citiesWeatherData[index];
            return WeatherCard(cityData: cityData);
          },
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> cityData;

  WeatherCard({required this.cityData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(cityData["city"]),
          ),
          ListTile(
            title: Text("Temperature: ${cityData["temperature"]}°C"),
          ),
          ListTile(
            title: Text("Condition: ${cityData["condition"]}"),
          ),
          ListTile(
            title: Text("Humidity: ${cityData["humidity"]}%"),
          ),
          ListTile(
            title: Text("Wind Speed: ${cityData["windSpeed"]} m/s"),
          ),
        ],
      ),
    );
  }
}
