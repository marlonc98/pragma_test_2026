import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: const Color.fromARGB(255, 107, 30, 9),
  ),
);
