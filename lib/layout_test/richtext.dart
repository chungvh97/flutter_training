import 'package:flutter/material.dart';

Container richtext() {
  return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 6, 19, 31)),
      child: Center(
          child: RichText(
        text: const TextSpan(
          text: 'Already have account?',
          style: TextStyle(
            fontSize: 22,
          ),
          children: [
            WidgetSpan(
              child: Icon(
                Icons.remove_red_eye_sharp,
                color: Colors.blue,
              ),
            ),
            TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                ))
          ],
        ),
      )));
}
