import 'package:blek/pages/about/about_page.dart';
import 'package:blek/pages/consultancy/consultancy_page.dart';
import 'package:blek/pages/contact/contact_page.dart';
import 'package:blek/widgets/colors.dart';

import 'package:blek/widgets/my_divider.dart';
import 'package:blek/widgets/my_signature.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkOlive,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Image.asset("assets/pics/pic.png", scale: 1.9),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'KOIDIO (Y.) BLÉ',
                          style: GoogleFonts.ubuntu(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: canaryYellow.withValues(alpha: 0.69),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'FULL-STACK DEVELOPER',
                          style: GoogleFonts.ubuntuMono(
                            color: lime100,
                            fontSize: 19.0,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.lime[100],
                            decorationThickness: 3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ROW ONE KOIDIO Y BLE END

                  /// ABOUT PAGE ///
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: InkWell(
                            hoverColor: midOlive,
                            onTap: () {},
                            child: Card(
                              elevation: 9.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              color: black,
                              child: Container(
                                height: 130.0,
                                width: 600.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightOlive),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            hoverColor: midOlive,
                                            color: lightGreen100,
                                            icon: const Icon(
                                              Icons.info_outlined,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const AboutPage(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 190.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                hoverColor: lightOlive,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const AboutPage(),
                                                    ),
                                                  );
                                                },

                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.0,
                                                  ),
                                                  child: Text(
                                                    'ABOUT\nFind out more about',
                                                    style: TextStyle(
                                                      color: green100,

                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                hoverColor: midOlive,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const AboutPage(),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.0,
                                                  ),
                                                  child: Text(
                                                    'who am I.',
                                                    style: TextStyle(
                                                      color: lime100,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: lightOlive),
                        //     borderRadius: BorderRadius.circular(3.33),
                        //     color: Colors.black,
                        //   ),
                        //   width: 600.0,
                        //   child: ExpansionTileGroup(
                        //     spaceBetweenItem: 16.0,

                        //     children: [
                        //       ExpansionTileItem(
                        //         iconColor: Colors.red[100],
                        //         collapsedIconColor: Colors.red[300],
                        //         title: Row(
                        //           children: [
                        //             Text(
                        //               'About:',
                        //               style: GoogleFonts.ubuntuMono(
                        //                 color: Colors.lime[100],
                        //                 decoration:
                        //                     TextDecoration.underline,
                        //                 decorationColor: Colors.lime[100],
                        //                 decorationThickness: 3,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         expandedAlignment: Alignment.centerLeft,
                        //         childrenPadding: const EdgeInsets.all(16),
                        //         children: [
                        //           Text(
                        //             '∙ Name: Koidio (Y.) Blé',
                        //             style: GoogleFonts.ubuntuMono(
                        //               color: Colors.lime[100],
                        //             ),
                        //           ),
                        //           const SizedBox(height: 9),
                        //           Text(
                        //             '∙ Occupation: Full-Stack Engineer.',
                        //             style: GoogleFonts.ubuntuMono(
                        //               color: Colors.lime[100],
                        //             ),
                        //           ),
                        //           const SizedBox(height: 9),
                        //           Text(
                        //             "∙ Passion: ",
                        //             style: GoogleFonts.ubuntuMono(
                        //               color: Colors.lime[100],
                        //             ),
                        //           ),
                        //           const SizedBox(height: 9),
                        //           Padding(
                        //             padding: const EdgeInsets.only(
                        //               left: 13,
                        //             ),
                        //             child: Text(
                        //               "Developing innovative software solutions that improve user experiences.",
                        //               style: GoogleFonts.ubuntuMono(
                        //                 color: Colors.lime[100],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        ///
                      ],
                    ),
                  ),

                  /// ABOUT PAGE END //

                  /// CONSULTANCY ///
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: InkWell(
                            hoverColor: midOlive,
                            onTap: () {},
                            child: Card(
                              elevation: 9.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              color: black,
                              child: Container(
                                height: 130.0,
                                width: 600.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightOlive),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            hoverColor: midOlive,
                                            color: lightGreen100,
                                            icon: const Icon(
                                              Icons.work_history_outlined,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const ConsultancyPage(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 190.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                hoverColor: lightOlive,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const ConsultancyPage(),
                                                    ),
                                                  );
                                                },

                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.0,
                                                  ),
                                                  child: Text(
                                                    'CONSULTANCY\nLearn more about',
                                                    style: TextStyle(
                                                      color: green100,

                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                hoverColor: midOlive,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const ConsultancyPage(),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.0,
                                                  ),
                                                  child: Text(
                                                    'what I do.',
                                                    style: TextStyle(
                                                      color: lime100,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CONSULTANCY PAGE END //

                  /// CONTACT PAGE///
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: InkWell(
                            hoverColor: midOlive,
                            onTap: () {},
                            child: Card(
                              elevation: 9.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              color: black,
                              child: Container(
                                height: 130.0,
                                width: 600.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightOlive),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 60.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            hoverColor: midOlive,
                                            color: lightGreen100,
                                            icon: const Icon(
                                              Icons.contact_support_outlined,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const ContactPage(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 190.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                hoverColor: lightOlive,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const ContactPage(),
                                                    ),
                                                  );
                                                },

                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.0,
                                                  ),
                                                  child: Text(
                                                    'CONTACT\nWant to get in touch?',
                                                    style: TextStyle(
                                                      color: green100,

                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                hoverColor: midOlive,
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const ContactPage(),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    3.0,
                                                  ),
                                                  child: Text(
                                                    'send me a message.',
                                                    style: TextStyle(
                                                      color: lime100,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // CONTACT PAGE END //
                  const SizedBox(height: 30.0),

                  const MyDivider(),

                  const SizedBox(height: 30.0),
                ],
              ),
            ),
            const MySignature(),
          ],
        ),
      ),
    );
  }
}
