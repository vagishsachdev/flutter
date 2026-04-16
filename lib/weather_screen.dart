import 'dart:convert';

import 'package:currency_converter/additional_information_component.dart';
import 'package:currency_converter/main_weather_card.dart';
import 'package:currency_converter/weather_forecast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  // parse uri here
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;

  Future getCurrentWeather() async {
    String cityName = 'London';
    final apiKey = dotenv.env['API_KEY'];
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey',
      ),
    );
    final data = jsonDecode(res.body);

    // setState(() {
    //   temp = data['list'][0]['main']['temp'];
    // });
    temp = data['list'][0]['main']['temp'];
  }

  @override
  void initState() {
    super.initState();
    // getCurrentWeather();
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

          // DATA - can be null
          return Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // main weather card
                MainWeatherCard(
                  temp: '$temp k',
                  icon: Icon(Icons.cloud, size: 70),
                  weather: 'Rain',
                ),
                // Weather Forecast,
                Text('Weather Forecast', style: titleTextStyle),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 2,
                    children: [
                      WeatherForecastCard(
                        time: '09:00',
                        icon: Icon(Icons.cloud, size: 35),
                        temp: '301.12',
                      ),
                      WeatherForecastCard(
                        time: '10:00',
                        icon: Icon(Icons.wind_power, size: 35),
                        temp: '301.12',
                      ),
                      WeatherForecastCard(
                        time: '11:00',
                        icon: Icon(Icons.sunny, size: 35),
                        temp: '444.12',
                      ),
                      WeatherForecastCard(
                        time: '12:00',
                        icon: Icon(Icons.cloud, size: 35),
                        temp: '301.12',
                      ),
                      WeatherForecastCard(
                        time: '01:00',
                        icon: Icon(Icons.grass, size: 35),
                        temp: '301.12',
                      ),
                      WeatherForecastCard(
                        time: '02:00',
                        icon: Icon(Icons.night_shelter, size: 35),
                        temp: '301.12',
                      ),
                    ],
                  ),
                ),
                // Additional Information
                Text('Additional Information', style: titleTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInformationComponent(
                      icon: Icon(Icons.water_drop, size: 35),
                      info: Text('Humidity', style: TextStyle(fontSize: 15)),
                      value: Text('94', style: TextStyle(fontSize: 15)),
                    ),
                    AdditionalInformationComponent(
                      icon: Icon(Icons.air, size: 35),
                      info: Text('Humidity', style: TextStyle(fontSize: 15)),
                      value: Text('94', style: TextStyle(fontSize: 15)),
                    ),
                    AdditionalInformationComponent(
                      icon: Icon(Icons.beach_access, size: 35),
                      info: Text('Humidity', style: TextStyle(fontSize: 15)),
                      value: Text('94', style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
