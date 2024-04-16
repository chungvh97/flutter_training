import 'package:flutter/material.dart';

class Complete extends StatelessWidget {
  const Complete({super.key});

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Index 1: Completed123',
        style: optionStyle,
      ),
    );
  }
}
