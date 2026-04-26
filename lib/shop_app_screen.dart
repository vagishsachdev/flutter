import 'package:currency_converter/filter_list.dart';
import 'package:currency_converter/header.dart';
import 'package:flutter/material.dart';

class ShopAppScreen extends StatelessWidget {
  const ShopAppScreen({super.key});
  final List<String> brandList = const [
    'Brand A',
    'Brand B',
    'Brand C',
    'Brand D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterList(list: brandList),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
