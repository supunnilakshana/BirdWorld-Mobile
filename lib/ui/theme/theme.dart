import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData.from(colorScheme: _lightColorScheme).copyWith(
        textTheme: GoogleFonts.robotoTextTheme(),
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonThemeData,
        textButtonTheme: _textButtonThemeData,
        brightness: Brightness.light,
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

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
          filled: true,
          border: AppStyle.textfiledBorder(),
          enabledBorder: AppStyle.textfiledBorder(),
          errorBorder: AppStyle.textfiledBorder(),
          focusedErrorBorder: AppStyle.textfiledBorder(),
          focusedBorder: AppStyle.textfiledBorder(),
          disabledBorder: AppStyle.textfiledBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
          hintStyle: AppStyle.fieldText,
          fillColor: AppColors.light_gray);

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.appPrimary,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
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
