import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';

class WebDevelopmentPage extends StatelessWidget {
  const WebDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Web development content
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'WEB DEVELOPMENT',
                style: TextStyle(
                  color: seafoamGreen,
                  fontSize: 19.0,
                  decoration: TextDecoration.underline,
                  decorationColor: seafoamGreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card.filled(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                borderOnForeground: true,
                color: transparentColor,
                child: Card(
                  elevation: 19,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.33)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGreen300,
                      border: Border.all(color: darkOlive),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              " ✦ With High-Quality Design ✦ ",
                              style: TextStyle(color: darkOlive),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.33)),
              ),
              borderOnForeground: true,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    hoverColor: lightGreen300,
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          "Create visually appealing and unique websites.",
                          style: TextStyle(color: darkOlive),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 19,
                color: lightGreen300,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        " ✦ Scalability ✦ ",
                        style: TextStyle(color: darkOlive),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.33)),
              ),
              borderOnForeground: true,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    hoverColor: lightGreen300,
                    onTap: () {},
                    child: Text(
                      "Ensuring it evolves with needs.",
                      style: TextStyle(color: darkOlive),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Card(
                elevation: 19,
                color: lightGreen300,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Improved User Experience ✦ ",
                      style: TextStyle(color: darkOlive),
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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    hoverColor: lightGreen300,
                    splashColor: lightGreen300,
                    onTap: () {},
                    child: Text(
                      "Higher user satisfaction and retention rates.",
                      style: TextStyle(color: darkOlive),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: lightGreen300,
                elevation: 19,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                borderOnForeground: true,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkOlive),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      " ✦ Ongoing Support & Maintenance ✦ ",
                      style: TextStyle(color: darkOlive),
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
                  hoverColor: lightGreen300,
                  onTap: () {},
                  child: Text(
                    "Keeping sites functional and up-to-date.",
                    style: TextStyle(color: darkOlive),
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
