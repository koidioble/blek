import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';

class MySignature extends StatelessWidget {
  const MySignature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Copyright © 2025 Blek Technologies.",
            style: TextStyle(color: white, fontSize: 13.0),
          ),
          Text(
            "All Rights Reserved.",
            style: TextStyle(color: white, fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}
