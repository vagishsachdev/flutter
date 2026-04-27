import 'package:flutter/material.dart';

class FilterList extends StatefulWidget {
  final List list;
  const FilterList({super.key, required this.list});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: widget.list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // set state needed because changing a variable alone wont redraw the ui
                  selectedIndex = index;
                });
                // print(selectedIndex);
              },
              child: Chip(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                label: Text(widget.list[index]),
                labelStyle: const TextStyle(
                  fontSize: 16,
                ),
                // border shape
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                // border color
                side: BorderSide(
                  color: const Color.fromRGBO(245, 247, 249, 1),
                ),
                backgroundColor: index != selectedIndex
                    ? Color.fromRGBO(245, 247, 249, 1)
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
