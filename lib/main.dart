import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MainApp());
  debugPaintSizeEnabled = false;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // == TEXT ==
              const Text(
                '0',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // == TEXT FIELD ==
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter amount in USD',
                    hintStyle: const TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.monetization_on),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    // when TextField is in focus
                    focusedBorder: border,
                    // when TextField is idle 
                    enabledBorder: border,
                  ),
                  // limiting input to number
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                ),
              ),

              // == BUTTON ==
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (kDebugMode) print('clicked');
                  }, 
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(15),
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(
                      Size(double.infinity,50)
                    ),
                  ),
                  child: const Text(
                    'Convert',
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
