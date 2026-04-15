import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 93;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

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
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: const Text('Currency Converter'),
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // == TEXT ==
                Text(
                  'INR ${result == 0 ? result.toStringAsFixed(0) : result.toStringAsFixed(3)}',
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
            
                // == TEXT FIELD ==
                TextField(
                  controller: textEditingController,
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

                // == PADDING ==
                const SizedBox(height: 10,),
        
                // == BUTTON ==
                ElevatedButton(
                  onPressed: () {
                    convert;
                    if (kDebugMode) {
                      print('clicked btn: ${textEditingController.text}');
                    }
                  },
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(15),
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                  ),
                  child: const Text('Convert'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
