import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_divider.dart';
import 'package:koidio_ble/widgets/my_signature.dart';

class ConsultancyPage extends StatefulWidget {
  const ConsultancyPage({super.key});

  @override
  State<ConsultancyPage> createState() => _ConsultancyPageState();
}

class _ConsultancyPageState extends State<ConsultancyPage> {
  final _controllerPageView = PageController(initialPage: 0);

  @override
  void dispose() {
    _controllerPageView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkOlive,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: green100),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("What I Do.", style: TextStyle(color: green100)),
        centerTitle: true,
      ),
      backgroundColor: darkOlive,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InkWell(
              hoverColor: canaryYellow,
              onTap: () {},
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                elevation: 9.0,
                color: darkOlive,
                child: Container(
                  height: 699.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: darkOlive,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Scaffold(
                      backgroundColor: transparentColor,
                      body: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _controllerPageView,
                        onPageChanged: (index) {
                          ('Page ${index + 1}');
                        },
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed:
                                          () =>
                                              _controllerPageView.previousPage(
                                                duration: const Duration(
                                                  seconds: 1,
                                                ),
                                                curve: Curves.easeInOut,
                                              ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_left_outlined,
                                        color: lightGreen100,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed:
                                          () => _controllerPageView.nextPage(
                                            duration: const Duration(
                                              seconds: 1,
                                            ),
                                            curve: Curves.easeInOut,
                                          ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: lightGreen100,
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(
                                    'Web Development',
                                    style: TextStyle(
                                      color: lightGreen100,
                                      fontSize: 19.0,
                                      decoration: TextDecoration.underline,
                                      decorationColor: lightGreen100,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Card.filled(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    color: transparentColor,
                                    child: Card(
                                      elevation: 19,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(3.33),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: lightGreen300,
                                          border: Border.all(
                                            color: lightGreen300,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Column(
                                              children: [
                                                Text(
                                                  " ✦ With High-Quality Design ✦ ",
                                                  style: TextStyle(
                                                    color: darkOlive,
                                                  ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.33),
                                    ),
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
                                        hoverColor: Colors.lightGreen[100],
                                        splashColor: Colors.lightGreen[100],
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Text(
                                              "Create visually appealing and unique websites.",
                                              style: TextStyle(
                                                color: darkOlive,
                                              ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(0.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: lightGreen300,
                                        ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.33),
                                    ),
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
                                        hoverColor: Colors.lightGreen[100],
                                        splashColor: Colors.lightGreen[300],
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
                                  padding: const EdgeInsets.all(16.0),
                                  child: Card(
                                    elevation: 19,
                                    color: lightGreen300,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(0.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: lightGreen300,
                                        ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.0),
                                    ),
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
                                        hoverColor: Colors.lightGreen[100],

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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(0.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: lightGreen300,
                                        ),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.0),
                                    ),
                                  ),
                                  borderOnForeground: true,
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: InkWell(
                                      hoverColor: lightGreen100,
                                      splashColor: lightGreen300,
                                      onTap: () {},
                                      child: Text(
                                        "Keeping sites functional and up-to-date.",
                                        style: TextStyle(color: darkOlive),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 90),
                                Text(
                                  "1 / 3",
                                  style: GoogleFonts.ubuntuMono(
                                    color: lightGreen300,
                                  ),
                                ),
                                const MyDivider(),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              color: transparentColor,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed:
                                            () => _controllerPageView
                                                .previousPage(
                                                  duration: const Duration(
                                                    seconds: 1,
                                                  ),
                                                  curve: Curves.easeInOut,
                                                ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_left_outlined,
                                          color: lightGreen100,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed:
                                            () => _controllerPageView.nextPage(
                                              duration: const Duration(
                                                seconds: 1,
                                              ),
                                              curve: Curves.easeInOut,
                                            ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: lightGreen100,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Text(
                                      'Mobile Development',
                                      style: TextStyle(
                                        color: lightGreen100,
                                        fontSize: 19.0,
                                        decoration: TextDecoration.underline,
                                        decorationColor: lightGreen100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Card(
                                      elevation: 19,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: lightGreen100,
                                          border: Border.all(
                                            color: transparentColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: lightGreen100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: transparentColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: lightGreen100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: transparentColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: lightGreen100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: lightGreen100,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
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
                                  const SizedBox(height: 90),
                                  const MyDivider(),
                                  Text(
                                    "2 / 3",
                                    style: GoogleFonts.ubuntuMono(
                                      color: lightGreen300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              color: transparentColor,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed:
                                            () => _controllerPageView
                                                .previousPage(
                                                  duration: const Duration(
                                                    seconds: 1,
                                                  ),
                                                  curve: Curves.easeInOut,
                                                ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_left_outlined,
                                          color: lightGreen100,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed:
                                            () => _controllerPageView.nextPage(
                                              duration: const Duration(
                                                seconds: 1,
                                              ),
                                              curve: Curves.easeInOut,
                                            ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_right_outlined,
                                          color: lightGreen100,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Text(
                                      'Software Development',
                                      style: TextStyle(
                                        color: lightGreen100,
                                        fontSize: 19.0,
                                        decoration: TextDecoration.underline,
                                        decorationColor: lightGreen100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Card(
                                      elevation: 19,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: green100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: green100),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: green100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: green100),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: InkWell(
                                        hoverColor: lightGreen100,
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
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: green100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: green100),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: InkWell(
                                        hoverColor: lightGreen100,
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
                                      elevation: 9,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      borderOnForeground: true,
                                      color: green100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: darkOlive),
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: InkWell(
                                        hoverColor: lightGreen100,
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
                                  const SizedBox(height: 90),
                                  Text(
                                    "3 / 3",
                                    style: GoogleFonts.ubuntuMono(
                                      color: lightGreen300,
                                    ),
                                  ),
                                  const MyDivider(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const MySignature(),
          ],
        ),
      ),
    );
  }
}
