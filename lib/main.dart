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
      home: const HomePage(),
    );
  }
}
