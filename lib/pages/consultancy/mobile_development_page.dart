import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';

class MobileDevelopmentPage extends StatelessWidget {
  const MobileDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(.0),
              child: Text(
                'Mobile Development',
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
                child: Container(
                  decoration: BoxDecoration(
                    color: lightGreen100,
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Cross-Platform Development ✦ ",
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
                  hoverColor: lightGreen100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "(iOS, Android, web, and desktop.)",
                    style: TextStyle(color: midOlive),
                  ),
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
                color: lightGreen100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Faster Development ✦ ",
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
                  hoverColor: lightGreen100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Hot reload allowing real-time changes.",
                    style: TextStyle(color: midOlive),
                  ),
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
                color: lightGreen100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Access to a Rich Ecosystem of Plugins ✦ ",
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
                  hoverColor: lightGreen100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Variety of plugins for integration.",
                    style: TextStyle(color: midOlive),
                    textAlign: TextAlign.center,
                  ),
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
                color: lightGreen100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Single Codebase ✦ ",
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
                  hoverColor: lightGreen100,
                  splashColor: Colors.lightGreen[300],
                  onTap: () {},
                  child: Text(
                    "Testing & maintaining are straightforward.",
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
