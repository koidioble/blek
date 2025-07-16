import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/pages/home/home_page.dart';
import 'package:koidio_ble/widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koidio Y. Blé',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        primaryColor: lightOlive,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('Debug: SplashScreen initState called');

    Future.delayed(Duration(seconds: 3), () {
      print('Debug: Splash screen delay completed');
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    try {
      (screenName: 'splash_screen');
      print('Debug: Analytics event logged');
    } catch (e) {
      print('Debug: Analytics error - $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Debug: SplashScreen build called');
    return Scaffold(
      backgroundColor: darkOlive,
      body: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [darkOlive, midOlive],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "KOIDIO",
                    // style: GoogleFonts.tektur(
                    //   color: seafoamGreen,
                    //   fontSize: 99.0,
                    //   shadows: [
                    //     Shadow(
                    //       blurRadius: 9.0,
                    //       color: lightSeaGreen,
                    //       offset: Offset(6.0, 6.0),
                    //     ),
                    //   ],
                    // ),
                    //   style: GoogleFonts.suravaram(
                    //     color: seafoamGreen,
                    //     fontSize: 99.0,
                    //     fontWeight: FontWeight.w600,
                    //     shadows: [
                    //       Shadow(
                    //         blurRadius: 9.0,
                    //         color: lightSeaGreen,
                    //         offset: Offset(6.0, 6.0),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //   style: GoogleFonts.orbitron(
                    //     color: seafoamGreen,
                    //     fontSize: 99.0,
                    //     fontWeight: FontWeight.w600,
                    //     shadows: [
                    //       Shadow(
                    //         blurRadius: 9.0,
                    //         color: lightSeaGreen,
                    //         offset: Offset(6.0, 6.0),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    textStyle: GoogleFonts.courierPrime(
                      color: oliveDrab,
                      fontSize: 69.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                      shadows: [
                        Shadow(
                          blurRadius: 30.0,
                          color: lightOlive.withValues(alpha: 6.0),
                          offset: Offset(6.0, 6.0),
                        ),
                      ],
                    ),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
