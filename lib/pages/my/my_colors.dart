import 'package:flutter/material.dart';

// =============================================================================
// CORE & NEUTRAL COLORS
// =============================================================================
Color transparent = Colors.transparent;

const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
// =============================================================================
// OLIVE & EARTH TONES
// =============================================================================
const Color oliveDark = Color(0xFF004242);
const Color oliveMid = Color(0xFF556B2F);
Color oliveLight = const Color(0xFF556b2f);
const Color oliveDrab = Color(0xFF6B8E23);
Color rifleGreen = const Color(0xFF444c38);
const Color sandyBrown = Color(0xFFA67C52);
const Color earthBrown = Color(0xFF8B7355);
const Color forestGreen = Color(0xFF228B22);

// =============================================================================
// MATERIAL GREEN VARIANTS
// =============================================================================
Color lightGreen100 = Colors.lightGreen.shade100;
Color lightGreen300 = Colors.lightGreen.shade300;
Color green100 = Colors.green.shade100;
Color green300 = Colors.green.shade300;
Color lime100 = Colors.lime.shade100;
Color lime300 = Colors.lime.shade300;

// =============================================================================
// AQUA & BLUE TONES
// =============================================================================
const Color deepSkyBlue = Color(0xFF00BFFF);
Color aquaMarine = const Color(0xFF7FFFD4);
Color aqua = const Color(0xFF00FFF0);
const Color turquoise = Color(0xFF40E0D0);
const Color seafoamGreen = Color(0xFF90EE90);
const Color lightSeaGreen = Color(0xFF20B2AA);
Color darkCyan = const Color(0xFF008B8B);

// =============================================================================
// DEEP BLUES & PURPLES
// =============================================================================
Color navy = const Color(0xFF000080);
const Color midnightBlue = Color(0xFF191970);
Color strongAzure = const Color(0xFF2980B9);
Color electricViolet = const Color(0xFF6d41e5);
Color modernIndigo = const Color(0xFF6366F1);
const Color cornflowerBlue = Color(0xFF6495ED);
const Color royalBlue = Color(0xFF4169E1);

// =============================================================================
// WARM & YELLOW TONES
// =============================================================================
const Color canaryYellow = Color(0xFFFFEF00);
Color cornsilk = const Color(0xFFFFF8DC);
Color lightBeige = const Color(0xFFF5F5DC);
Color softGold = const Color(0xFFFFD700);

// =============================================================================
// PINK & PEACH TONES
// =============================================================================
Color softPink = const Color(0xFFFFC0CB);
Color pastelPink = const Color(0xFFFFD1DC);
Color blushPink = const Color(0xFFFFB6C1);
Color peach = const Color(0xFFFFE5B4);
Color lightPeach = const Color(0xFFFFF0D4);
Color roseGold = const Color(0xFFB76E79);
Color champagne = const Color(0xFFF7E7CE);
Color lightCream = const Color(0xFFFFFAF0);

Color lightSalmon = const Color(0xFFFFA07A);

// =============================================================================
// LAVENDER & PURPLE TONES
// =============================================================================
Color lightLavender = const Color(0xFFE6E6FA);
Color paleLavender = const Color(0xFFDCD0FF);

// =============================================================================
// ACCENT & UTILITY COLORS
// =============================================================================
Color lightCoral = const Color(0xFFde4672);

// Redefining the colors with a richer, darker theme for the 'BLEK' palette
const Color blekPrimaryDark = Color(0xFF08080A); // Very deep, rich black/blue
const Color blekCardDark = Color(
  0xFF1A1B23,
); // Slightly lighter card background
const Color blekAccentBlue = Color(0xFF44C7F4); // Vibrant Blue
const Color blekAccentMagenta = Color(0xFFF444C7); // Vibrant Magenta
const Color blekAccentGreen = Color(0xFF98FB98); // Pale Green for highlights

// =============================================================================
// COLOR GROUPS FOR THEMING
// =============================================================================
class ColorPalettes {
  // Natural/earth theme
  static final List<Color> earthTones = [
    oliveDark,
    oliveMid,
    oliveLight,
    oliveDrab,
    rifleGreen,
  ];

  // Cool/water theme
  static final List<Color> coolTones = [
    deepSkyBlue,
    aquaMarine,
    turquoise,
    seafoamGreen,
    lightSeaGreen,
    darkCyan,
  ];

  // Warm/sunset theme
  static final List<Color> warmTones = [
    peach,
    lightPeach,
    roseGold,
    champagne,
    softGold,
    canaryYellow,
  ];

  // Pastel theme
  static final List<Color> pastelTones = [
    softPink,
    pastelPink,
    blushPink,
    lightLavender,
    paleLavender,
    lightBeige,
  ];
}

// =============================================================================
// THEME EXTENSIONS (FOR BETTER THEME MANAGEMENT)
// =============================================================================
class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF556b2f); // oliveLight
  static const Color primaryDark = Color(0xFF263212); // oliveMid
  static const Color primaryLight = Color(0xFF6b8e23); // oliveDrab

  // Secondary colors
  static const Color secondary = Color(0xFF2980B9); // stongAzure
  static const Color secondaryLight = Color(0xFF00BFFF); // deepSkyBlue

  // Accent colors
  static const Color accent = Color(0xFFFFFF8F); // canaryYellow
  static const Color error = Color(0xFFde4672); // lightCoral
  static const Color success = Color(0xFF93E9BE); // seafoamGreen

  // Neutral colors
  static const Color background = Color(0xFFF5F5DC); // lightBeige
  static const Color surface = Color(0xFFFFF8DC); // cornsilk
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.black;
}
