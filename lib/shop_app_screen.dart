import 'package:currency_converter/filter_list.dart';
import 'package:currency_converter/header.dart';
import 'package:currency_converter/product_list.dart';
import 'package:flutter/material.dart';

class ShopAppScreen extends StatelessWidget {
  const ShopAppScreen({super.key});
  final List<String> brandList = const [
    'All',
    'Nike',
    'Adidas',
    'Bata',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterList(list: brandList),
                    SizedBox(
                      height: 20,
                    ),
                    ProductList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
