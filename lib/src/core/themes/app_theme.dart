import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get defaultTheme => darkTheme;

  static const Color _buttonColor = Color(0xFF8859C8);
  static const Color _buttonDisabledColor = Colors.grey;
  static const Color _iconColor = Color(0xFFB46FFE);

  //* Dark Mode
  static const Color _darkPrimaryColor = Color(0xFF24242E);
  static const Color _darkPrimaryVariantColor = Color(0xFF1A1A22);
  static const Color _darkSecondaryColor = Color(0xFF9F5CE5);
  static const Color _darkSecondaryVariantColor = Color(0xFF4A4D6B);

  /// Light color when in dark mode
  static const Color _darkOnPrimaryColor = _lightPrimaryColor;

  //* Light Mode
  static const Color _lightPrimaryColor = Color(0xFFF7F7F7);
  static const Color _lightPrimaryVariantColor =
      Colors.white; //Color(0xFFAEB0B1);
  static const Color _lightSecondaryColor = Color(0xFF9F5CE5);

  /// Dark color when in light mode
  static const Color _lightOnPrimaryColor = _darkPrimaryColor;

  //* Icon theme
  static const IconThemeData _iconTheme = IconThemeData(
    color: _iconColor,
  );

  //* Button Theme

  static const ButtonThemeData _buttonTheme = ButtonThemeData(
    buttonColor: _buttonColor,
    disabledColor: _buttonDisabledColor,
  );

  //* Text theme dark mode

  static const TextTheme _darkTextTheme = TextTheme(
    headline4: _darkMainHeaderTextStyle,
    headline5: _darkSubHeaderTextStyle,
    headline6: _darkSectionHeaderTextStyle,
    subtitle1: _darkbodySubTitleStyle,
    subtitle2: _darkbodySubtitle2Style,
    bodyText1: _darkbodyTextStyle,
    bodyText2: _darkbodyAltTextStyle,
    caption: _captionTextStyle,
  );

  //* Text Styles dark mode
  static const TextStyle _darkMainHeaderTextStyle = TextStyle(fontSize: 36.0);
  static const TextStyle _darkSubHeaderTextStyle = TextStyle(fontSize: 24.0);
  static const TextStyle _darkSectionHeaderTextStyle =
      TextStyle(fontSize: 22.0);

  static const TextStyle _darkbodySubTitleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _darkbodySubtitle2Style = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _darkbodyTextStyle = TextStyle(fontSize: 12.0);
  static const TextStyle _darkbodyAltTextStyle = TextStyle(fontSize: 12.0);

  //* Text Styles light mode
  static const TextStyle _lightMainHeaderTextStyle = TextStyle(fontSize: 36.0);
  static const TextStyle _lightSubHeaderTextStyle = TextStyle(fontSize: 24.0);
  static const TextStyle _lightSectionHeaderTextStyle =
      TextStyle(fontSize: 22.0);
  static const TextStyle _lightbodySubTitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _lightbodySubtitle2Style = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _lightbodyTextStyle = TextStyle(fontSize: 12.0);
  static const TextStyle _lightbodyAltTextStyle = TextStyle(fontSize: 12.0);

  //* caption Text Style
  static const TextStyle _captionTextStyle = TextStyle(fontSize: 10.0);

  //* Text theme light mode

  static const TextTheme _lightTextTheme = TextTheme(
    headline4: _lightMainHeaderTextStyle,
    headline5: _lightSubHeaderTextStyle,
    headline6: _lightSectionHeaderTextStyle,
    subtitle1: _lightbodySubTitleStyle,
    subtitle2: _lightbodySubtitle2Style,
    bodyText1: _lightbodyTextStyle,
    bodyText2: _lightbodyAltTextStyle,
    caption: _captionTextStyle,
  );

  //* Theme data dark mode

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    primarySwatch: Colors.brown,
    colorScheme: ColorScheme.dark(
      primary: _darkOnPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
      secondaryVariant: _darkSecondaryVariantColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    iconTheme: _iconTheme,
    buttonTheme: _buttonTheme,
    textTheme: _darkTextTheme,
  );

  //* Theme data light mode

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    colorScheme: ColorScheme.dark(
      primary: _lightOnPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      secondaryVariant: _darkSecondaryVariantColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    buttonTheme: _buttonTheme,
    textTheme: _lightTextTheme,
  );
}
