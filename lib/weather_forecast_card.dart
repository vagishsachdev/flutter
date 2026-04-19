import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final Widget icon;
  final String temp;
  const WeatherForecastCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temp
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        child: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // time
                Text(
                  // '09:00',
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                // icon
                // Icon(Icons.cloud, size: 35),
                icon,
                // temp
                SizedBox(
                  height: 4,
                ),
                Text(
                  // '301.14',
                  temp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
