import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';

class MySignature extends StatelessWidget {
  const MySignature({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          Text(
            "Copyright © 2024 All Rights Reserved.",
            style: TextStyle(color: white, fontSize: 9.0),
          ),
        ],
      ),
    );
  }
}
