import 'package:flutter/material.dart';

class WeatherIconMapper extends StatelessWidget {
  final String iconCode;
  final double size;

  const WeatherIconMapper({
    super.key,
    required this.iconCode,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final code = iconCode.substring(0, 2);
    final isDay = iconCode.endsWith('d');
    return switch (code) {
      // Clear sky
      '01' => Icon(
        isDay ? Icons.wb_sunny : Icons.nights_stay,
        size: size,
        color: isDay ? Colors.amber : Colors.indigo,
      ),

      // Few clouds
      '02' => Icon(
        isDay ? Icons.wb_cloudy : Icons.cloud,
        size: size,
        color: isDay ? Colors.orange : Colors.blueGrey,
      ),

      // Scattered clouds
      '03' => Icon(
        Icons.cloud,
        size: size,
        color: Colors.grey,
      ),

      // Broken clouds
      '04' => Icon(
        Icons.cloud_queue,
        size: size,
        color: Colors.grey.shade600,
      ),

      // Shower rain
      '09' => Icon(
        Icons.grain,
        size: size,
        color: Colors.blue,
      ),

      // Rain
      '10' => Icon(
        Icons.umbrella,
        size: size,
        color: Colors.blueAccent,
      ),

      // Thunderstorm
      '11' => Icon(
        Icons.thunderstorm,
        size: size,
        color: Colors.deepPurple,
      ),

      // Snow
      '13' => Icon(
        Icons.ac_unit,
        size: size,
        color: Colors.lightBlue,
      ),

      // Mist / Fog / Haze
      '50' => Icon(
        Icons.foggy,
        size: size,
        color: Colors.blueGrey,
      ),

      // Default fallback
      _ => Icon(
        Icons.cloud,
        size: size,
        color: Colors.grey,
      ),
    };
  }
}
