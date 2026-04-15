import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class AdditionalInformationComponent extends StatelessWidget {
  final Icon icon;
  final Text info;
  final Text value;

  const AdditionalInformationComponent({
    super.key,
    required this.icon,
    required this.info,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [icon, info, value],
      ),
    );
  }
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    final titleTextStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 22);

    final cardTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 40,
    );

    final weatherForecastScrollableCardContainer = Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 3,
        children: [
          // time
          Text('09:00', style: cardTextStyle.copyWith(fontSize: 15)),
          // icon
          Icon(Icons.cloud, size: 35),
          // temp
          Text(
            '301.14',
            style: cardTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );

    final weatherForecastScrollableCard = Card(
      elevation: 100,
      child: Center(child: weatherForecastScrollableCardContainer),
    );

    final weatherForecastScrollable = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 5,
        children: [
          weatherForecastScrollableCard,
          weatherForecastScrollableCard,
          weatherForecastScrollableCard,
          weatherForecastScrollableCard,
          weatherForecastScrollableCard,
          weatherForecastScrollableCard,
        ],
      ),
    );

    final mainWeatherCardContainer = Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          // temp
          Text('300.67 F', style: cardTextStyle),
          // icon
          Icon(Icons.cloud, size: 70),
          // status
          Text(
            'Rain',
            style: cardTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );

    final mainWeatherCard = Card(
      elevation: 100,
      child: Center(child: mainWeatherCardContainer),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: Icon(Icons.add),
        title: Text('Weather App'),
        actions: [Icon(Icons.replay)],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          // main weather card
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainWeatherCard,
            // Weather Forecast,
            Text('Weather Forecast', style: titleTextStyle),
            weatherForecastScrollable,
            // Additional Information
            Text('Additional Information', style: titleTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                AdditionalInformationComponent(
                  icon: Icon(
                    Icons.water_drop,
                    size: 35,
                  ), 
                  info: Text(
                    'Humidity', 
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  value: Text(
                    '94',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
                AdditionalInformationComponent(
                  icon: Icon(
                    Icons.water_drop,
                    size: 35,
                  ), 
                  info: Text(
                    'Humidity', 
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  value: Text(
                    '94',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
                AdditionalInformationComponent(
                  icon: Icon(
                    Icons.water_drop,
                    size: 35,
                  ), 
                  info: Text(
                    'Humidity', 
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  value: Text(
                    '94',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
