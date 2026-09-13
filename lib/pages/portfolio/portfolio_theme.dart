import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/my/my_colors.dart';

class PortfolioTheme {
  final Brightness brightness;
  final Color bg;
  final Color surface;
  final Color surface2;
  final Color surface3;
  final Color border;
  final Color borderHov;
  final Color borderGlow;
  final Color accent;
  final Color accent2;
  final Color accent3;
  final Color gradStart;
  final Color gradEnd;
  final Color text;
  final Color textSub;
  final Color muted;

  PortfolioTheme._({
    required this.brightness,
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.surface3,
    required this.border,
    required this.borderHov,
    required this.borderGlow,
    required this.accent,
    required this.accent2,
    required this.accent3,
    required this.gradStart,
    required this.gradEnd,
    required this.text,
    required this.textSub,
    required this.muted,
  });

  factory PortfolioTheme.of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isDark) {
      // Kept intentionally simple: plain black background/surfaces instead
      // of a mixed dark-navy palette. Only the olive accent adds color.
      return PortfolioTheme._(
        brightness: Brightness.dark,
        bg: Colors.black,
        surface: Colors.black,
        surface2: const Color(0xFF0A0A0A),
        surface3: const Color(0xFF141414),
        border: const Color(0x1AFFFFFF),
        borderHov: const Color(0x556B8E23),
        borderGlow: const Color(0x996B8E23),
        accent: oliveDrab,
        accent2: oliveLight,
        accent3: const Color(0xFFFF5E7A),
        gradStart: oliveDrab,
        gradEnd: const Color(0xFF6B8E23),
        text: const Color(0xFFF5F5F5),
        textSub: const Color(0xFFCCCCCC),
        muted: const Color(0xFF8A8A8A),
      );
    } else {
      return PortfolioTheme._(
        brightness: Brightness.light,
        bg: const Color(0xFFF8F9FA),
        surface: const Color(0xFFFFFFFF),
        surface2: const Color(0xFFF1F3F9),
        surface3: const Color(0xFFE8EBF4),
        border: const Color(0x18000000),
        borderHov: const Color(0x557C6FFF),
        borderGlow: const Color(0x997C6FFF),
        accent: oliveLight,
        accent2: lime300,
        accent3: const Color(0xFFFF5E7A),
        gradStart: const Color(0xFF5B4FE8),
        gradEnd: const Color(0xFF00C4A7),
        text: const Color(0xFF0D0F1A),
        textSub: const Color(0xFF3D4466),
        muted: const Color(0xFF8890AA),
      );
    }
  }
}

// ── Typography helper ─────────────────────────────────────────────────────────
TextStyle pStyle({
  double size = 14,
  FontWeight weight = FontWeight.w400,
  required Color color,
  double height = 1.5,
  double letterSpacing = 0,
}) => TextStyle(
  fontSize: size,
  fontWeight: weight,
  color: color,
  height: height,
  letterSpacing: letterSpacing,
);

// ── Spacing ───────────────────────────────────────────────────────────────────
const double kPad = 40.0;
const double kPadM = 20.0;

// ── Card decorations ──────────────────────────────────────────────────────────
BoxDecoration cardDecoration({
  required Color borderColor,
  required Color bgColor,
  double radius = 14,
}) => BoxDecoration(
  color: bgColor,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: borderColor, width: 1),
);

BoxDecoration glowCardDecoration({
  required Color accentColor,
  required Color bgColor,
  double radius = 16,
  double glowRadius = 24,
}) => BoxDecoration(
  color: bgColor,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: accentColor.withValues(alpha: 0.35), width: 1),
  boxShadow: [
    BoxShadow(
      color: accentColor.withValues(alpha: 0.12),
      blurRadius: glowRadius,
      spreadRadius: 0,
    ),
  ],
);

BoxDecoration gradientPillDecoration(PortfolioTheme t, {double radius = 100}) =>
    BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: LinearGradient(
        colors: [
          t.gradStart.withValues(alpha: 0.18),
          t.gradEnd.withValues(alpha: 0.12),
        ],
      ),
      border: Border.all(color: t.gradStart.withValues(alpha: 0.3), width: 1),
    );

// ── Color matchers ────────────────────────────────────────────────────────────
enum SkillColor {
  electricViolet,
  aquaMarine,
  amber,
  blue,
  coral,
  champagne,
  seafoamGreen,
  lightsalmon,
}

Color skillAccent(SkillColor c, PortfolioTheme t) {
  final isDark = t.brightness == Brightness.dark;
  return switch (c) {
    SkillColor.electricViolet => electricViolet,
    SkillColor.aquaMarine => aquaMarine,
    // 0xFFFFBD2E is a light gold that loses contrast on a white surface;
    // darken it for light mode only.
    SkillColor.amber =>
      isDark ? const Color(0xFFFFBD2E) : const Color(0xFFB8860B),
    SkillColor.blue => const Color(0xFF4CA8FF),
    SkillColor.coral => t.accent3,
    // champagne / seafoamGreen / lightsalmon are all pale pastels tuned for
    // a dark card — swap in deeper, more saturated versions on light mode.
    SkillColor.champagne => isDark ? champagne : const Color(0xFF9C7A3C),
    SkillColor.seafoamGreen => isDark ? seafoamGreen : const Color(0xFF2E8B57),
    SkillColor.lightsalmon => isDark ? lightSalmon : const Color(0xFFC1440E),
  };
}

enum ProjectColor {
  purple,
  teal,
  coral,
  amber,
  forestGreen,
  canaryYellow,
  cornsilk,
}

Color projectAccent(ProjectColor c, PortfolioTheme t) {
  final isDark = t.brightness == Brightness.dark;
  return switch (c) {
    ProjectColor.purple => t.accent,
    ProjectColor.teal => t.accent2,
    ProjectColor.coral => t.accent3,
    // Same light-gold contrast problem as skillAccent's amber.
    ProjectColor.amber =>
      isDark ? const Color(0xFFFFBD2E) : const Color(0xFFC97F0A),
    // forestGreen already reads fine on both bg colors, no change needed.
    ProjectColor.forestGreen => forestGreen,
    // canaryYellow (0xFFFFEF00) is essentially invisible on a white card —
    // use a deep goldenrod instead so borders/badges/text stay legible.
    ProjectColor.canaryYellow =>
      isDark ? canaryYellow : const Color(0xFFB8860B),
    // cornsilk (0xFFFFF8DC) is nearly identical to the light surface color —
    // use a warm brown so it still reads as a distinct accent.
    ProjectColor.cornsilk => isDark ? cornsilk : const Color(0xFF9C7A3C),
  };
}
