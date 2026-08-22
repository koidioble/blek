import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:koidio_ble/pages/portfolio/portfolio_page.dart'; // ← NEW
import 'package:koidio_ble/services/activity_monitor.dart';
import 'package:koidio_ble/services/supabase_auth_service.dart';
import 'package:koidio_ble/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseAuthService.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Dark portfolio — status bar icons light, nav bar dark
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // ← changed
      systemNavigationBarColor: Color(0xFF0A0A0F), // ← changed
      systemNavigationBarIconBrightness: Brightness.light, // ← changed
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      debugPrint('🔐 Auth Event: ${data.event}');
    });

    SupabaseAuthService.setInactivityLogoutCallback(() {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged out due to inactivity'),
          backgroundColor: Colors.orange,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, _) {
        return MaterialApp(
          title: 'Koidio Y. Blé | Software Engineer',
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),

          // Google Fonts applied on top of your existing themes — unchanged
          theme: ThemeProvider.lightTheme.copyWith(
            textTheme: GoogleFonts.plusJakartaSansTextTheme(
              ThemeProvider.lightTheme.textTheme,
            ),
          ),
          darkTheme: ThemeProvider.darkTheme.copyWith(
            textTheme: GoogleFonts.plusJakartaSansTextTheme(
              ThemeProvider.darkTheme.textTheme,
            ),
          ),
          themeMode: themeProvider.themeMode,

          locale: themeProvider.locale,

          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },

          // ActivityMonitor preserved — wraps PortfolioPage instead of MainScreen
          home: ActivityMonitor(
            onInactivityLogout: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out due to inactivity'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            child: const PortfolioPage(), // ← swapped, no scroll wiring needed
          ),
        );
      },
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
