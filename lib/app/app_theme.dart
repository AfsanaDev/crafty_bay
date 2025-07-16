import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
        ),
        textTheme: _textTheme,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            border: _getInputBorder(AppColors.themeColor),
            enabledBorder: _getInputBorder(AppColors.themeColor),
            focusedBorder: _getInputBorder(AppColors.themeColor),
            errorBorder: _getInputBorder(Colors.red),
            hintStyle: const TextStyle(
              fontWeight:FontWeight.w400,
              color: Colors.grey
            )
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(double.maxFinite),
                  backgroundColor: AppColors.themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(12),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4
                    )
                ),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black87
        )
            )
            );
  }
  static OutlineInputBorder _getInputBorder(Color color){
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.2,),
    );
  }
  static TextTheme get _textTheme {
    return const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: .4,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: .4,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ));
  }
}
