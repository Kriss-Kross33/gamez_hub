import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const Color buttonColor = Color(0xFF8859C8);
  static const Color buttonDisabledColor = Colors.grey;
  static const Color iconColor = Color(0xFFB46FFE);

  //* Dark Mode
  static const Color darkPrimaryColor = Color(0xFF24242E);
  static const Color darkPrimaryVariantConr = Color(0xFF1A1A22);
  static const Color darkSecondaryColor = Color(0xFF9F5CE5);
  static const Color darkSecondaryVariantColor = Color(0xFF4A4D6B);

  /// Light color when in dark mode
  static const Color darkOnPrimaryColor = lightPrimaryColor;

  //* Light Mode
  static const Color lightPrimaryColor = Color(0xFFF7F7F7);
  static const Color lightPrimaryVariantColor =
      Colors.white; //Color(0xFFAEB0B1);
  static const Color lightSecondaryColor = Color(0xFF9F5CE5);
}
