import 'package:flutter/material.dart';

class AppColors {
  static const Color md_theme_light_primary = Color(0xFF242A68);
  static const Color md_theme_light_onPrimary = Color(0xFFffffff);
  static const Color md_theme_light_primaryContainer = Color(0xFFFFFDF6);
  static const Color md_theme_light_onPrimaryContainer = Color(0xFF151515);
  static const Color md_theme_light_secondary = Color(0xFF713E30);
  static const Color md_theme_light_onSecondary = Color(0xFFffffff);
  static const Color md_theme_light_secondaryContainer = Color(0xFFffdad5);
  static const Color md_theme_light_onSecondaryContainer = Color(0xFF410002);
  static const Color md_theme_light_tertiary = Color(0xFF713E30);
  static const Color md_theme_light_onTertiary = Color(0xFFffffff);
  static const Color md_theme_light_tertiaryContainer = Color(0xffffdbc6);
  static const Color md_theme_light_onTertiaryContainer = Color(0xFF331200);
  static const Color md_theme_light_error = Color(0xFFba1b1b);
  static const Color md_theme_light_errorContainer = Color(0xFFFFFDF6);
  static const Color md_theme_light_onError = Color(0xFFffffff);
  static const Color md_theme_light_onErrorContainer = Color(0xFF410001);
  static const Color md_theme_light_background =
      Color.fromARGB(255, 255, 255, 255);
  static const Color md_theme_light_onBackground = Color(0xFF211a19);
  static const Color md_theme_light_surface = Color(0xFFFFFDF6);
  static const Color md_theme_light_onSurface = Color(0xFF211a19);
  static const Color md_theme_light_surfaceVariant = Color(0xFFf4ddda);
  static const Color md_theme_light_onSurfaceVariant = Color(0xFF534341);
  static const Color md_theme_light_outline = Color(0xFF857371);
  static const Color md_theme_light_inverseOnSurface = Color(0xFFfbeeec);
  static const Color md_theme_light_inverseSurface = Color(0xFF362f2e);
  static const Color md_theme_light_font = Color.fromARGB(255, 13, 13, 14);

  static const Color md_theme_dark_primary = Color(0xFF242A68);
  static const Color md_theme_dark_onPrimary = Color(0xFF680003);
  static const Color md_theme_dark_primaryContainer = Color(0xFF930007);
  static const Color md_theme_dark_onPrimaryContainer = Color(0xFFFFFDF6);
  static const Color md_theme_dark_secondary = Color(0xffffb3aa);
  static const Color md_theme_dark_onSecondary = Color(0xFF680005);
  static const Color md_theme_dark_secondaryContainer = Color(0xFF93000c);
  static const Color md_theme_dark_onSecondaryContainer = Color(0xFFffdad5);
  static const Color md_theme_dark_tertiary = Color(0xFFffb689);
  static const Color md_theme_dark_onTertiary = Color(0xFF542200);
  static const Color md_theme_dark_tertiaryContainer = Color(0xFF763300);
  static const Color md_theme_dark_onTertiaryContainer = Color(0xFFffdbc6);
  static const Color md_theme_dark_error = Color(0xFFffb4a9);
  static const Color md_theme_dark_errorContainer = Color(0xFF930006);
  static const Color md_theme_dark_onError = Color(0xFF680003);
  static const Color md_theme_dark_onErrorContainer = Color(0xFFFFFDF6);
  static const Color md_theme_dark_background = Color.fromARGB(255, 31, 31, 31);
  static const Color md_theme_dark_onBackground = Color(0xFFede0de);
  static const Color md_theme_dark_surface = Color(0xFF211a19);
  static const Color md_theme_dark_onSurface = Color(0xFF1f1f1f);
  static const Color md_theme_dark_surfaceVariant = Color(0xFF534341);
  static const Color md_theme_dark_onSurfaceVariant = Color(0xFFd8c2bf);
  static const Color md_theme_dark_outline = Color(0xFFa08c8a);
  static const Color md_theme_dark_inverseOnSurface = Color(0xFF211a19);
  static const Color md_theme_dark_inverseSurface = Color(0xFFede0de);
  static const Color md_theme_dark_font = Color.fromARGB(255, 13, 13, 14);

  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFffffff);
  static const Color yellow = Color(0xFFFDCD03);
  static const Color maroon = Color(0xFF820606);
  static const Color blue = Color(0xFF0066FF);
  static const Color darkBlue = Color(0xFF054AB1);
  static const Color green = Color(0xFF31AA52);
  static const Color gray = Color(0xFF4E4E4E);
  static const Color light_gray = Color(0xFFFCFCFC);
  static const Color white_gray = Color(0xFFF2F2F2);

  static const Color inProgress = Color(0xFFFDA50F);
  static const Color completed = Color(0xFF0B6623);
  static const Color canceled = Color(0xFFC21807);
  static Color transyellow = const Color(0xFFFDCD03).withOpacity(0.3);

  static Color primary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_primary
        : md_theme_dark_primary;
  }

  static Color fontcolor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_font
        : md_theme_dark_font;
  }

  static Color primaryContainer(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_primaryContainer
        : md_theme_dark_primaryContainer;
  }

  static Color onPrimaryContainer(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_onPrimaryContainer
        : md_theme_dark_onPrimaryContainer;
  }

  static Color error(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_error
        : md_theme_dark_error;
  }

  static Color onError(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_onError
        : md_theme_dark_onError;
  }
}
