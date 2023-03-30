import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData.from(colorScheme: _darkColorScheme).copyWith(
        textTheme: GoogleFonts.robotoTextTheme(),
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonThemeData,
        textButtonTheme: _textButtonThemeData,
        listTileTheme: _listTileThemeData);
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
      primary: AppColors.md_theme_light_primary,
      primaryContainer: AppColors.md_theme_light_primaryContainer,
      onPrimaryContainer: AppColors.md_theme_light_onPrimaryContainer,
      secondary: AppColors.md_theme_light_secondary,
      surface: AppColors.md_theme_light_surface,
      background: AppColors.md_theme_light_background,
      error: AppColors.md_theme_light_error,
      onPrimary: AppColors.md_theme_light_onPrimary,
      onSecondary: AppColors.md_theme_light_onSecondary,
      onSurface: AppColors.md_theme_light_onSurface,
      onBackground: AppColors.md_theme_light_onBackground,
      onError: AppColors.md_theme_light_onError,
      brightness: Brightness.light);

  static const ColorScheme _darkColorScheme = ColorScheme(
      primary: AppColors.md_theme_dark_primary,
      primaryContainer: AppColors.md_theme_dark_primaryContainer,
      onPrimaryContainer: AppColors.md_theme_dark_onPrimaryContainer,
      secondary: AppColors.md_theme_dark_secondary,
      surface: AppColors.md_theme_dark_surface,
      background: AppColors.md_theme_dark_background,
      error: AppColors.md_theme_dark_error,
      onPrimary: AppColors.md_theme_dark_onPrimary,
      onSecondary: AppColors.md_theme_dark_onSecondary,
      onSurface: AppColors.md_theme_dark_onSurface,
      onBackground: AppColors.md_theme_dark_onBackground,
      onError: AppColors.md_theme_dark_error,
      brightness: Brightness.dark);

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
          hintStyle: AppStyle.fieldText,
          fillColor: AppColors.white);

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.md_theme_dark_primary,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  static final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
  static final ListTileThemeData _listTileThemeData = ListTileThemeData(
    iconColor: AppColors.light_gray,
    textColor: AppColors.light_gray,
    tileColor: Colors.transparent,
    selectedTileColor: AppColors.transyellow,
    selectedColor: AppColors.transyellow,
    shape: RoundedRectangleBorder(
      side: const BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
