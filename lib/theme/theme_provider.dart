// lib/theme/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:koidio_ble/pages/my/my_colors.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // dark by default
  Locale _locale = const Locale('en');

  ThemeProvider() {
    _loadPreferences();
  }

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  // ── Load saved preferences ────────────────────────────────────────────────
  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final themeModeString = prefs.getString('theme_mode');
      if (themeModeString != null) {
        _themeMode = ThemeMode.values.firstWhere(
          (mode) => mode.toString() == themeModeString,
          orElse: () => ThemeMode.dark,
        );
      }

      final languageCode = prefs.getString('language_code');
      if (languageCode != null) {
        _locale = Locale(languageCode);
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error loading preferences: $e');
    }
  }

  // ── Set theme mode (used by SettingsPage) ────────────────────────────────
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme_mode', mode.toString());
    } catch (e) {
      debugPrint('Error saving theme mode: $e');
    }
  }

  // ── Toggle (used by footer icon) ─────────────────────────────────────────
  Future<void> toggleTheme() async {
    final next =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }

  // ── Set locale ────────────────────────────────────────────────────────────
  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', locale.languageCode);
    } catch (e) {
      debugPrint('Error saving locale: $e');
    }
  }

  // ── Light Theme ───────────────────────────────────────────────────────────
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: oliveDrab,
    scaffoldBackgroundColor: white,
    colorScheme: ColorScheme.light(
      primary: oliveDrab,
      secondary: turquoise,
      surface: white,
      error: Colors.red.shade400,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      foregroundColor: black,
      elevation: 0,
      iconTheme: IconThemeData(color: oliveDrab),
    ),
    cardTheme: CardThemeData(
      color: white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: oliveDrab,
        foregroundColor: white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  // ── Dark Theme ────────────────────────────────────────────────────────────
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: oliveLight,
    scaffoldBackgroundColor: const Color(0xFF0A0A0F),
    colorScheme: ColorScheme.dark(
      primary: oliveLight,
      secondary: turquoise,
      surface: const Color(0xFF1E1E1E),
      error: Colors.red.shade300,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      foregroundColor: white,
      elevation: 0,
      iconTheme: IconThemeData(color: oliveLight),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: oliveLight,
        foregroundColor: black,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
