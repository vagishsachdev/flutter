import 'package:currency_converter/header.dart';
import 'package:flutter/material.dart';

class FilterList extends StatelessWidget {
  final List list;
  const FilterList({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Chip(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              label: Text(list[index]),
              labelStyle: const TextStyle(
                fontSize: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(
                color: const Color.fromRGBO(245, 247, 249, 1),
              ),
              backgroundColor: Color.fromRGBO(245, 247, 249, 1),
            ),
          );
        },
      ),
    );
  }
}

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
