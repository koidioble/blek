import 'dart:async';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  final Locale _locale = const Locale('en');
  Timer? _ticker;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  // Modern definitions for base setups
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A0A0F),
  );

  ThemeProvider() {
    _initializeDayNightTracking();
  }

  void enableAutoTheme() {
    _ticker?.cancel(); // clear any existing timer first, just in case
    _updateThemeBasedOnTime(); // immediately sync to current time
    _ticker = Timer.periodic(const Duration(minutes: 15), (timer) {
      _updateThemeBasedOnTime();
    });
  }

  void _initializeDayNightTracking() {
    _updateThemeBasedOnTime();
    // Re-check system environment status every 15 minutes automatically
    _ticker = Timer.periodic(const Duration(minutes: 15), (timer) {
      _updateThemeBasedOnTime();
    });
  }

  void _updateThemeBasedOnTime() {
    final currentHour = DateTime.now().hour;

    // Light mode from 6:00 AM (6) to 6:00 PM (18)
    final ThemeMode expectedMode =
        (currentHour >= 6 && currentHour < 18)
            ? ThemeMode.light
            : ThemeMode.dark;

    if (_themeMode != expectedMode) {
      _themeMode = expectedMode;
      notifyListeners();
    }
  }

  // Allow users to force manually over-ride if needed later
  void setManualTheme(ThemeMode mode) {
    _ticker?.cancel(); // Kill timer loop if manual control is chosen
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    final newMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setManualTheme(newMode);
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}
