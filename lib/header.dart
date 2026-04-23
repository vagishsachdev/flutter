import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({super.key});
  final border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(50),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Text(
            'Shoes\nCollection',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
