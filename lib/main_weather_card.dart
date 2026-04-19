import 'dart:ui';
import 'package:flutter/material.dart';

class MainWeatherCard extends StatelessWidget {
  final String temp;
  final Widget icon;
  final String weather;
  
  const MainWeatherCard({
    super.key,
    required this.temp,
    required this.icon,
    required this.weather
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Padding(
              // top and bottom padding
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    // '300.67 F',
                    temp,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  // Icon(Icons.cloud, size: 70),
                  icon,
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    // 'Rain',
                    weather,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
