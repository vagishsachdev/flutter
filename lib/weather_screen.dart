import 'dart:convert';

import 'package:currency_converter/additional_information_component.dart';
import 'package:currency_converter/main_weather_card.dart';
import 'package:currency_converter/weather_forecast_card.dart';
import 'package:currency_converter/weather_icon_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future getCurrentWeather() async {
    String cityName = 'Delhi';
    final apiKey = dotenv.env['API_KEY'];
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey',
      ),
    );
    final data = jsonDecode(res.body);
    return data;
  }

  Widget _buildMainCard(Map data) {
    final String temp = data['list'][0]['main']['temp'].toString();
    final String iconCode = data['list'][0]['weather'][0]['icon'];
    final String weather = data['list'][0]['weather'][0]['main'];
    return MainWeatherCard(
      temp: '${(double.parse(temp) - 273.15).toStringAsFixed(2)}°C',
      icon: WeatherIconMapper(iconCode: iconCode, size: 70),
      weather: weather,
    );
  }

  Widget _buildScrollableForecast(Map data) {
    String formatTime(dynamic timestamp) {
      final date = DateTime.fromMillisecondsSinceEpoch(
        timestamp *
            1000, // ← multiply by 1000 (timestamp is in seconds, Dart needs milliseconds)
      );
      // format to 12 hour with AM/PM
      final hour = date.hour;
      final minute = date.minute.toString().padLeft(2, '0'); // "5" → "05"
      final period = hour >= 12 ? 'PM' : 'AM';
      final hour12 = hour % 12 == 0 ? 12 : hour % 12; // convert 0 → 12, 13 → 1
      return '$hour12:$minute $period'; // "9:00 AM"
    }
    List item = data['list'].sublist(1, 9); // 8 cards
    
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsGeometry.only(right: 4),
            child: WeatherForecastCard(
              time: formatTime(item[index]['dt']).toString(),
              icon: WeatherIconMapper(iconCode: item[index]['weather'][0]['icon'], size: 35),
              temp: '${(item[index]['main']['temp'].toDouble()-273.15).toStringAsFixed(2)}°C',
            ),
          );
        },
      ),
    );
  }

  Widget _buildAdditionalInfo(Map data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AdditionalInformationComponent(
          icon: Icon(Icons.opacity, size: 35),
          info: Text('Humidity', style: TextStyle(fontSize: 15)),
          value: Text(
            '${data['list'][0]['main']['humidity']}%',
            style: TextStyle(fontSize: 15),
          ),
        ),
        AdditionalInformationComponent(
          icon: Icon(Icons.air, size: 35),
          info: Text('Wind Speed', style: TextStyle(fontSize: 15)),
          value: Text(
            '${data['list'][0]['wind']['speed'].toStringAsFixed(2)} m/s',
            style: TextStyle(fontSize: 15),
          ),
        ),
        AdditionalInformationComponent(
          icon: Icon(Icons.beach_access, size: 35),
          info: Text('Pressure', style: TextStyle(fontSize: 15)),
          value: Text(
            '${data['list'][0]['main']['pressure']} hPa',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 22);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 48,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.replay),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          // LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          // ERROR
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          //EXTRACT DATA
          final Map<String, dynamic> data = snapshot.data;

          return Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Weather Card
                _buildMainCard(data),
                // Weather Forecast,
                Text('Weather Forecast', style: titleTextStyle),
                _buildScrollableForecast(data),
                // Additional Information
                Text('Additional Information', style: titleTextStyle),
                _buildAdditionalInfo(data),
              ],
            ),
          );
        },
      ),
    );
  }
}
