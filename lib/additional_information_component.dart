import 'package:flutter/material.dart';

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
    return Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [icon, info, value],
      );
  }
}
