import 'package:flutter/material.dart';

const String name = 'Chung';

Center textDemo() {
  return Center(
    child: Text(
      'Hello $name',
      textAlign: TextAlign.center,
      maxLines: 2,
      style: TextStyle(
        fontSize: 50,
        fontStyle: FontStyle.italic,
        decorationStyle: TextDecorationStyle.dotted,
        shadows: const [
          Shadow(
            color: Colors.red,
            blurRadius: 10.0,
            offset: Offset(2, 2),
          ),
        ],
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [
              Colors.red,
              Colors.green,
              Colors.blue,
            ],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 400, 20)),
      ),
    ),
  );
}
