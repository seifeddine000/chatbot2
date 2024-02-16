import 'package:flutter/material.dart';

// Define the custom color
final Color customBlue = Color(0xFF041955);

final lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: customBlue,
    onSecondary: Colors.white,
    tertiary: Colors.grey.shade400,
    onTertiary: Colors.black54


  ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: Colors.blueGrey,
    onPrimary: Colors.white,
    secondary: Colors.blueGrey,
    onSecondary: Colors.white,
      tertiary: Colors.grey.shade800,
      onTertiary: Colors.white
  ),
);
