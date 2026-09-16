import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:koidio_ble/pages/portfolio/portfolio_page.dart';
import 'package:koidio_ble/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0A0A0F),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, _) {
        return MaterialApp(
          title: 'Koidio Y. Blé | Software Engineer',
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
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
          home: const PortfolioPage(),
        );
      },
      child: const PortfolioPage(),
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
