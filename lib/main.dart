import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColumnBar(),
              ColumnBar(),
              ColumnBar()
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnBar extends StatelessWidget {
  const ColumnBar({super.key});
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Test')],
      ),
    );
  }
}
