import 'package:flutter/material.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_divider.dart';
import 'package:koidio_ble/widgets/my_signature.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _controllerPageView = PageController(initialPage: 0);

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
        title: Column(
          children: [Text("Who Am I.", style: TextStyle(color: green100))],
        ),
        iconTheme: IconThemeData(
          color: darkOlive,
        ), // Changed to match icon color
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
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Scaffold(
                      backgroundColor: transparentColor,
                      body: PageView(
                        scrollDirection: Axis.vertical,
                        controller: _controllerPageView,
                        onPageChanged: (index) {
                          ('Page ${index + 1}');
                        },
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 60.0),
                                // PADDING 1 / 3
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 300,
                                  ),
                                  child: InkWell(
                                    hoverColor: lightGreen100,
                                    splashColor: lightGreen100,
                                    highlightColor: lightGreen100.withValues(
                                      alpha: 0.3,
                                    ),
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    onTap: () {},
                                    child: Card(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(9.0),
                                        ),
                                      ),
                                      color: transparentColor,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [black, rifleGreen],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border: Border.all(color: lightOlive),
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: lime100.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 6.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(0, 3.0),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Text(
                                            "Hello and Welcome!",
                                            style: TextStyle(
                                              color: lightGreen100,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.6,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 600,
                                  ),
                                  child: InkWell(
                                    hoverColor: lightGreen100,
                                    splashColor: lightGreen100,
                                    highlightColor: lightGreen100.withValues(
                                      alpha: 0.3,
                                    ),
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    onTap: () {},
                                    child: Card(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(9.0),
                                        ),
                                      ),
                                      color: transparentColor,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [black, rifleGreen],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border: Border.all(color: lightOlive),
                                          borderRadius: BorderRadius.circular(
                                            9.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: lime100.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 6.0,
                                              spreadRadius: 1.0,
                                              offset: const Offset(0, 3.0),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Text(
                                            "I'm a passionate developer dedicated to",
                                            style: TextStyle(
                                              color: lightGreen100,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.6,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "build innovative and efficient softwares, mobile and web applications.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // PADDING 1 / 3 FIN
                                const SizedBox(height: 60.0),

                                // PADDING 2 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "My origins are in Côte d'Ivoire and Senegal,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "I reside, study, and work in the USA.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "and I was born and bred in Abidjan.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // PADDING 2 / 3 FIN
                                const SizedBox(height: 60.0),
                                // PADDING 3 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "I use engineering principles to",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Construct, Design, Develop,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Test, and Maintain Programs.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 90.0),

                                Text(
                                  "1 / 3",
                                  style: TextStyle(color: lightGreen300),
                                ),
                                const MyDivider(),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 90.0),

                                // PADDING 1 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "I enjoy Designing, Writing,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Drawing, Sketching, Painting,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "and doing Research.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // PADDING 1 / 3 FIN
                                const SizedBox(height: 90.0),

                                // PADDING 2 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Anthropology, History, Geography, Culture,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Technology and Various Science are",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "subjects that have an interest in me.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // PADDING 2 / 3 FIN
                                const SizedBox(height: 60.0),
                                // PADDING 3 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Reading books related to my interests, learning new materials,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "and coding codes are activities",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "that I find enjoyable.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 60.0),
                                Text(
                                  "2 / 3",
                                  style: TextStyle(color: lightGreen300),
                                ),
                                const MyDivider(),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 60.0),

                                // PADDING 1 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "I am a believer in high-quality work.,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "a Perfectible Aspiring,",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "and a measure accuracy thinker.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // PADDING 2 / 3
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "My skills include proficiency in\n∙ Front-end Development: HTML, CSS, and JavaScript.\n∙ Front-end Frameworks/Libraries: React, Flutter, Angular, and Vue.js.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Back-end Development\n∙ Server-side Languages: Python, Ruby, Java, PHP, Node.js.\n∙ Back-end Frameworks: Django, Ruby on Rails, Express.js.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "Database Management\n∙ SQL Databases: MySQL, PostgreSQL, SQLite, and SQL Server.\n∙ NoSQL Databases: MongoDB, Firebase.\n∙ Version Control: Git, GitHub.\n∙ DevOps: Docker, CI/CD.\n∙ And Web Hosting.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  hoverColor: lightGreen100,
                                  splashColor: lightGreen100,
                                  highlightColor: lightGreen100.withValues(
                                    alpha: 0.3,
                                  ),
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  onTap: () {},
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9.0),
                                      ),
                                    ),
                                    color: transparentColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [black, rifleGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        border: Border.all(color: lightOlive),
                                        borderRadius: BorderRadius.circular(
                                          9.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: lime100.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: const Offset(0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          "I have experience in\n∙ Program design,\n∙ Database Programming,\n∙ And knowledge of software architecture.",
                                          style: TextStyle(
                                            color: lightGreen100,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.6,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 60.0),
                                Text(
                                  "3 / 3",
                                  style: TextStyle(color: lightGreen300),
                                ),
                                const MyDivider(),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // ---------------------------------------------------- ??

                      // body: Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.transparent),
                      //   ),
                      //   width: Responsive.isMobile(context)
                      //       ? Responsive.widthOfScreen(context) * 0.9
                      //       : Responsive.widthOfScreen(context) * 0.8,
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.vertical,
                      //     child: Center(
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: <Widget>[
                      //           Padding(
                      //             padding: const EdgeInsets.only(top: 9),
                      //             child: InkWell(
                      //               hoverColor: lightOlive,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: Colors.transparent,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: Colors.transparent,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "Welcome! I am a passionate full stack engineer dedicated to creating innovative and efficient mobile and web applications.",
                      //                       style: GoogleFonts.ubuntu(
                      //                           color: darkOlive,
                      //                           fontWeight: FontWeight.w600),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: lightOlive,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "My origins are in Côte d'Ivoire and Senegal, and I was born and bred in Abidjan. I reside, study, and work in Indianapolis, IN, USA.",
                      //                       textAlign: TextAlign.center,
                      //                       style: GoogleFonts.ubuntu(
                      //                           color: darkOlive,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: lightOlive,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(8)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "I use engineering principles to construct, design, develop, test, and maintain physical and digital programs.",
                      //                       textAlign: TextAlign.center,
                      //                       style: GoogleFonts.ubuntu(
                      //                           color: darkOlive,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.symmetric(horizontal: 133),
                      //             child: Divider(
                      //               color: lightOlive,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: lightOlive,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "I enjoy designing, drawing, and painting.",
                      //                       textAlign: TextAlign.center,
                      //                       style: GoogleFonts.ubuntu(
                      //                         color: darkOlive,
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: canaryYellow,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9),
                      //                     child: Text(
                      //                       "Anthroplogy, technology and science are subjects that have an insterest in me.",
                      //                       style: GoogleFonts.ubuntu(
                      //                         color: darkOlive,
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: canaryYellow,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "Reading books, learning new materials, and programming code are activities that I find enjoyable.",
                      //                       style: GoogleFonts.ubuntu(
                      //                         color: darkOlive,
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding:
                      //                 const EdgeInsets.symmetric(horizontal: 133.0),
                      //             child: Divider(
                      //               color: lightOlive,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: canaryYellow,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(
                      //                         color: lightOlive,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "Believer, perfectible, I'm a hopeful thinker.",
                      //                       style: GoogleFonts.ubuntu(
                      //                         color: darkOlive,
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: lightOlive,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "My skills include being a Web Designer, Flutter Developer, and a Full-Stack Engineer.",
                      //                       style: GoogleFonts.ubuntu(
                      //                         color: darkOlive,
                      //                         fontWeight: FontWeight.w600,
                      //                       ),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(3),
                      //             child: InkWell(
                      //               hoverColor: lightOlive,
                      //               onTap: () {},
                      //               child: Card(
                      //                 elevation: 0.0,
                      //                 shape: const RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.all(Radius.circular(9))),
                      //                 borderOnForeground: true,
                      //                 color: transparentColor,
                      //                 child: Container(
                      //                   decoration: BoxDecoration(
                      //                       color: transparentColor,
                      //                       border: Border.all(color: lightOlive),
                      //                       borderRadius: BorderRadius.circular(9)),
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(9.99),
                      //                     child: Text(
                      //                       "I have experience in program design, database programming, and knowledge of software architecture.",
                      //                       style: GoogleFonts.ubuntu(
                      //                           color: darkOlive,
                      //                           fontWeight: FontWeight.w600),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(16.0),
                      //             child: Divider(
                      //               color: midOlive,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(16.0),
                      //             child: Text(
                      //               "© Koidio Y. Blé - 2024",
                      //               style: GoogleFonts.ubuntu(color: midOlive),
                      //             ),
                      //           ),
                      //           const SizedBox(height: 9),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
