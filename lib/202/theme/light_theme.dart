import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  //late final ThemeData theme; => _textColor değişse de değiştirmez.
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(

      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
        backgroundColor: Colors.purple
      ),

      scaffoldBackgroundColor: Colors.white,

      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.green),

      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
              onPrimary: Colors.purple, onSecondary: _lightColor.blueMana)),

      colorScheme: ColorScheme.light(),

      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: Colors.red),
        fillColor: WidgetStateProperty.all(Colors.yellow)
      ),

      textTheme: ThemeData.light().textTheme.copyWith(
              labelMedium: TextStyle(
            fontSize: 25,
            color: _lightColor._textColor,
          ),
      ),

    );
  }
}

class _LightColor {
  final Color _textColor = Colors.redAccent;
  final Color blueMana = Color.fromARGB(95, 188, 248, 1);
}
