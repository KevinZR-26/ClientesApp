import 'package:flutter/material.dart';

Widget loader(String s) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>( Color(int.parse('0xFF1A4E7E'))),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          s,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}