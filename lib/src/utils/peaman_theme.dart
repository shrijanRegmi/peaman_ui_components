import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTheme {
  static Brightness? _brightness;

  static ThemeData get _defaultTheme {
    return ThemeData(
      brightness: _brightness,
      fontFamily: GoogleFonts.nunito().fontFamily,
      floatingActionButtonTheme: ThemeData().floatingActionButtonTheme.copyWith(
            foregroundColor: PeamanColors.white,
          ),
    );
  }

  static ThemeData get lightThemePalette {
    _brightness = Brightness.light;
    return _defaultTheme.copyWith(
      scaffoldBackgroundColor: PeamanColors.cream,
      appBarTheme: _defaultTheme.appBarTheme.copyWith(
        elevation: null,
        backgroundColor: PeamanColors.cream,
        foregroundColor: PeamanColors.black87,
        shadowColor: PeamanColors.extraLightGrey.withOpacity(0.2),
        titleTextStyle: GoogleFonts.nunito().copyWith(
          color: _defaultTheme.textTheme.titleLarge?.color,
        ),
        iconTheme: IconThemeData(
          color: _defaultTheme.textTheme.titleLarge?.color,
        ),
      ),
      colorScheme: _defaultTheme.colorScheme.copyWith(
        primary: PeamanColors.primary,
        secondary: PeamanColors.primary,
        background: PeamanColors.containerBg,
        shadow: PeamanColors.extraLightGrey,
      ),
      textTheme: _defaultTheme.textTheme.apply(
        bodyColor: PeamanColors.black87,
        displayColor: PeamanColors.black87,
        decorationColor: PeamanColors.black87,
      ),
      progressIndicatorTheme: _defaultTheme.progressIndicatorTheme.copyWith(
        color: PeamanColors.primary,
      ),
      inputDecorationTheme: _defaultTheme.inputDecorationTheme.copyWith(
        fillColor: PeamanColors.white,
        prefixIconColor: PeamanColors.primary,
        suffixIconColor: PeamanColors.primary,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      floatingActionButtonTheme:
          _defaultTheme.floatingActionButtonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PeamanColors.primary,
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          textStyle: TextStyle(
            fontFamily: _defaultTheme.textTheme.labelLarge?.fontFamily,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(18.0),
          side: const BorderSide(
            color: PeamanColors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          textStyle: TextStyle(
            fontFamily: _defaultTheme.textTheme.labelLarge?.fontFamily,
          ),
        ),
      ),
      bottomSheetTheme: _defaultTheme.bottomSheetTheme.copyWith(
        backgroundColor: PeamanColors.cream,
      ),
    );
  }

  static ThemeData get darkThemePalette {
    _brightness = Brightness.dark;
    return _defaultTheme.copyWith(
      appBarTheme: _defaultTheme.appBarTheme.copyWith(
        elevation: null,
        backgroundColor: PeamanColors.containerBgDark,
        foregroundColor: PeamanColors.white70,
        shadowColor: PeamanColors.black.withOpacity(0.5),
      ),
      colorScheme: _defaultTheme.colorScheme.copyWith(
        primary: PeamanColors.primaryDark,
        secondary: PeamanColors.primaryDark,
        background: PeamanColors.containerBgDark,
        shadow: PeamanColors.black.withOpacity(0.5),
      ),
      textTheme: _defaultTheme.textTheme.apply(
        bodyColor: PeamanColors.white70,
        displayColor: PeamanColors.white70,
        decorationColor: PeamanColors.white70,
      ),
      textSelectionTheme: _defaultTheme.textSelectionTheme.copyWith(
        cursorColor: PeamanColors.grey,
      ),
      progressIndicatorTheme: _defaultTheme.progressIndicatorTheme.copyWith(
        color: PeamanColors.grey,
      ),
      floatingActionButtonTheme:
          _defaultTheme.floatingActionButtonTheme.copyWith(
        foregroundColor: PeamanColors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      inputDecorationTheme: _defaultTheme.inputDecorationTheme.copyWith(
        fillColor: PeamanColors.containerBgDark,
        prefixIconColor: PeamanColors.grey,
        suffixIconColor: PeamanColors.black,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.containerBgDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.containerBgDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: PeamanColors.containerBgDark,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 18.0,
        ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PeamanColors.primaryDark,
          padding: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          textStyle: TextStyle(
            fontFamily: _defaultTheme.textTheme.labelLarge?.fontFamily,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(18.0),
          side: const BorderSide(
            color: PeamanColors.white70,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          foregroundColor: PeamanColors.white70,
          textStyle: TextStyle(
            fontFamily: _defaultTheme.textTheme.labelLarge?.fontFamily,
          ),
        ),
      ),
      bottomSheetTheme: _defaultTheme.bottomSheetTheme.copyWith(
        backgroundColor: PeamanColors.containerBgDark,
      ),
    );
  }
}
