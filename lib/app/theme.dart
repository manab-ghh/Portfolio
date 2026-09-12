import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color bg = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF11111E);
  static const Color surfaceElevated = Color(0xFF1A1A2E);
  static const Color surfaceLight = Color(0xFF222238);

  // Borders
  static const Color border = Color(0xFF232338);
  static const Color borderSubtle = Color(0x1FFFFFFF);
  static const Color borderHover = Color(0x40818CF8);

  // Accents
  static const Color primary = Color(0xFF818CF8); // Indigo 400
  static const Color primaryDark = Color(0xFF6366F1); // Indigo 500
  static const Color secondary = Color(0xFFA78BFA); // Violet 400
  static const Color secondaryDark = Color(0xFF8B5CF6); // Violet 500
  static const Color cyan = Color(0xFF38BDF8); // Sky 400
  static const Color emerald = Color(0xFF34D399); // Emerald 400
  static const Color amber = Color(0xFFFBBF24); // Amber 400
  static const Color rose = Color(0xFFFB7185); // Rose 400

  // Text
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroTextGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFCBD5E1), primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cyanPurpleGradient = LinearGradient(
    colors: [cyan, primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    colors: [Color(0x25818CF8), Color(0x10A78BFA), Colors.transparent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double section = 80.0;
  static const double sectionMobile = 52.0;
}

class AppRadius {
  AppRadius._();

  static const double sm = 6.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double pill = 999.0;

  static BorderRadius radiusSm = BorderRadius.circular(sm);
  static BorderRadius radiusMd = BorderRadius.circular(md);
  static BorderRadius radiusLg = BorderRadius.circular(lg);
  static BorderRadius radiusXl = BorderRadius.circular(xl);
  static BorderRadius radiusPill = BorderRadius.circular(pill);
}

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bg,
      fontFamily: 'Inter',
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
      ),
      dividerColor: AppColors.border,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(AppColors.primary.withValues(alpha: 0.3)),
        radius: const Radius.circular(AppRadius.pill),
        thickness: WidgetStateProperty.all(6),
      ),
    );
  }
}
