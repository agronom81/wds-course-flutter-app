import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromRGBO(83, 177, 117, 1.0),
  ),
  scaffoldBackgroundColor: Colors.white,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
          const Color.fromRGBO(83, 177, 117, 1.0)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(124, 124, 124, 1),
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color.fromRGBO(24, 23, 37, 1),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
);
