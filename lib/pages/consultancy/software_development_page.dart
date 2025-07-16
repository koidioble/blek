import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';

class SoftwareDevelopmentPage extends StatelessWidget {
  const SoftwareDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentColor,

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Software Development',
                style: TextStyle(
                  color: seafoamGreen,
                  fontSize: 19.0,
                  decoration: TextDecoration.underline,
                  decorationColor: seafoamGreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 19,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                color: green100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Cost Efficiency ✦ ",
                      style: TextStyle(
                        color: darkOlive,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  hoverColor: green100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Can handle both front-end and back-end development.",
                    style: TextStyle(color: midOlive),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 9,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                color: green100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Holistic Understanding ✦ ",
                      style: TextStyle(
                        color: darkOlive,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  hoverColor: green100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Comprehensive understanding of the entire process.",
                    style: TextStyle(color: midOlive),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 9,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                color: green100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Improved Problem-Solving ✦ ",
                      style: TextStyle(
                        color: darkOlive,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  hoverColor: green100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Find quick and effective solutions to problems.",
                    style: TextStyle(color: midOlive),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 9.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                color: green100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Greater Project Control ✦ ",
                      style: TextStyle(
                        color: darkOlive,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: InkWell(
                  hoverColor: green100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Ensure consistency & quality throughout the process.",
                    style: TextStyle(color: midOlive),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
