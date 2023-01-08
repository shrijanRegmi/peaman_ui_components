import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTheme {
  static Brightness? _brightness;

  static ThemeData get _defaultTheme {
    return ThemeData(
      brightness: _brightness,
      fontFamily: GoogleFonts.nunito().fontFamily,
    );
  }

  static ThemeData get lightThemePalette {
    _brightness = Brightness.light;
    return _defaultTheme.copyWith(
      scaffoldBackgroundColor: PeamanColors.cream,
      appBarTheme: _defaultTheme.appBarTheme.copyWith(
        elevation: null,
        backgroundColor: PeamanColors.cream,
        shadowColor: PeamanColors.extraLightGrey,
        titleTextStyle: GoogleFonts.nunito().copyWith(
          color: _defaultTheme.textTheme.titleLarge?.color,
        ),
        iconTheme: IconThemeData(
          color: _defaultTheme.textTheme.titleLarge?.color,
        ),
      ),
      colorScheme: _defaultTheme.colorScheme.copyWith(
        primary: PeamanColors.primary,
        secondary: PeamanColors.secondary,
        background: PeamanColors.containerBg,
        shadow: PeamanColors.extraLightGrey,
      ),
      inputDecorationTheme: _defaultTheme.inputDecorationTheme.copyWith(
        fillColor: PeamanColors.white,
        prefixIconColor: PeamanColors.secondary,
        suffixIconColor: PeamanColors.secondary,
      ),
    );
  }

  static ThemeData get darkThemePalette {
    _brightness = Brightness.dark;
    return _defaultTheme.copyWith(
      appBarTheme: _defaultTheme.appBarTheme.copyWith(
        elevation: null,
        backgroundColor: PeamanColors.containerBgDark,
        shadowColor: PeamanColors.black.withOpacity(0.5),
      ),
      colorScheme: _defaultTheme.colorScheme.copyWith(
        primary: PeamanColors.primaryDark,
        secondary: PeamanColors.secondaryDark,
        background: PeamanColors.containerBgDark,
        shadow: PeamanColors.black.withOpacity(0.5),
      ),
      textSelectionTheme: _defaultTheme.textSelectionTheme.copyWith(
        cursorColor: PeamanColors.grey,
      ),
      inputDecorationTheme: _defaultTheme.inputDecorationTheme.copyWith(
        fillColor: PeamanColors.containerBgDark,
        prefixIconColor: PeamanColors.grey,
        suffixIconColor: PeamanColors.black,
      ),
    );
  }
}
