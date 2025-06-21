import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';

class MySignature extends StatelessWidget {
  const MySignature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "© Koidio Y. Blé - 2025",
        style: TextStyle(color: lightOlive),
      ),
    );
  }
}
