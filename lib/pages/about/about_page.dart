import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_divider.dart';
import 'package:koidio_ble/widgets/my_signature.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isAboutHovered = false;
  bool _showBackToTop = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (mounted) {
        setState(() {
          _showBackToTop = _scrollController.offset > 200;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkOlive,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: seafoamGreen),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: InkWell(
            hoverColor: midOlive.withValues(alpha: 0.39),
            onTap: () {},
            child: MouseRegion(
              onEnter: (event) => setState(() => _isAboutHovered = true),
              onExit: (event) => setState(() => _isAboutHovered = false),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "About Me",
                  style: TextStyle(
                    color: _isAboutHovered ? oliveDrab : white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3.0,
                    fontSize: 13.0,
                    shadows: [
                      Shadow(
                        blurRadius: 0.9,
                        color: cornsilk.withValues(alpha: 0.6),
                        offset: const Offset(0.3, 0.3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: darkCyan.withValues(alpha: 0.69),
        body: RawScrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thickness: 3.0,
          radius: const Radius.circular(6.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          trackVisibility: true,
          thumbColor: turquoise.withValues(alpha: 0.9),
          trackColor: darkCyan.withValues(alpha: 0.9),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: InkWell(
              hoverColor: darkOlive,
              highlightColor: darkCyan,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(0.3),
                child: Card(
                  color: lightOlive,
                  elevation: 9.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [darkOlive, lightOlive],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Card(
                        color: lightOlive,
                        elevation: 9.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            // maxWidth: MediaQuery.sizeOf(context).width,
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [darkOlive, lightOlive],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(color: lightOlive),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16.0),
                              // Section 1
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "I'm a passionate developer dedicated to",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "build innovative and efficient softwares,",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        " mobile and web applications.",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Section 2
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "I do like Doing Research.",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: Container(
                                    width: 399.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: darkCyan.withValues(alpha: 0.69),
                                      ),
                                      color: darkCyan.withValues(alpha: 0.69),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "STEM and Arts are",
                                          maxWidth: 600.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    width: 399.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: darkCyan.withValues(alpha: 0.69),
                                      ),
                                      color: darkCyan.withValues(alpha: 0.69),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "subjects that have an interest in me.",
                                          maxWidth: 600.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: Container(
                                    width: 600.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: darkCyan.withValues(alpha: 0.69),
                                      ),
                                      color: darkCyan.withValues(alpha: 0.69),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "Reading books related to my interests, learning new materials,",
                                          maxWidth: 600.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "and coding codes are activities",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "that I find enjoyable.",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              // Section 3
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "I am a believer in high-quality work,",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "a Perfectible Aspiring,",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "a measure accuracy thinker.",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0), // Section 4
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "My skills include proficiency in",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "FRONT-END DEVELOPMENT:",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "∙ HTML, CSS, and JavaScript.",
                                          maxWidth: 600.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SizedBox(
                                            width: 60.0,
                                            height: 60.0,
                                            child: Image.asset(
                                              "assets/logo/html_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SizedBox(
                                            width: 60.0,
                                            height: 60.0,
                                            child: Image.asset(
                                              "assets/logo/css_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SizedBox(
                                            width: 60.0,
                                            height: 60.0,
                                            child: Image.asset(
                                              "assets/logo/javascript_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "∙ Front-end Frameworks/Libraries: React, Flutter.",
                                          maxWidth: 600.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: white),
                                              borderRadius:
                                                  BorderRadius.circular(9.0),
                                              color: white,
                                            ),
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/react_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: white),
                                              borderRadius:
                                                  BorderRadius.circular(9.0),
                                              color: white,
                                            ),
                                            width: 69.0,
                                            height: 69.0,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                6.0,
                                              ),
                                              child: Image.asset(
                                                "assets/logo/flutter_logo.png",
                                                scale: 9.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "BACK-END DEVELOPMENT:",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "∙ Server-side Languages:Java, PHP, Node.js.",
                                          maxWidth: 600.0,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: white),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: white,
                                            ),
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/java_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: white),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: white,
                                            ),
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/php_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: white),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: white,
                                            ),
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/node_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "DATABASE MANAGEMENT:",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "∙ NoSQL Databases: Firebase.",
                                        maxWidth: 600.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: SizedBox(
                                          width: 69.0,
                                          height: 69.0,
                                          child: Image.asset(
                                            "assets/logo/firebase_logo.png",
                                            scale: 9.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "VERSION CONTROL:",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "∙ GitHub.",
                                        maxWidth: 600.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: SizedBox(
                                          width: 69.0,
                                          height: 69.0,
                                          child: Image.asset(
                                            "assets/logo/github_logo.png",
                                            scale: 9.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "DevOps:",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "∙ Docker, KoboToolblox, CI/CD.",
                                          maxWidth: 600.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SizedBox(
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/docker_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SizedBox(
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/kobo_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: SizedBox(
                                            width: 69.0,
                                            height: 69.0,
                                            child: Image.asset(
                                              "assets/logo/ci_cd_logo.png",
                                              scale: 9.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 399.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildAnimatedCard(
                                        "WEB HOSTING",
                                        maxWidth: 600.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 33.0),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Container(
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkCyan.withValues(alpha: 0.69),
                                    ),
                                    color: darkCyan.withValues(alpha: 0.69),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildAnimatedCard(
                                          "I have experience in:"
                                          "Programs design,"
                                          "Database Programming,"
                                          "And knowledge of software architecture.",
                                          maxWidth: 600.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 33.0),
                              const MyDivider(),
                              const SizedBox(height: 16.0),
                              const MySignature(),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton:
            _showBackToTop
                ? FloatingActionButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                  backgroundColor: lightOlive,
                  tooltip: 'Back to Top',
                  shape: CircleBorder(side: BorderSide(color: seafoamGreen)),
                  child: Icon(Icons.arrow_circle_up, color: seafoamGreen),
                )
                : null,
      ),
    );
  }

  Widget _buildAnimatedCard(String text, {double maxWidth = 600.0}) {
    return AnimatedCard(text: text, maxWidth: maxWidth);
  }
}

class AnimatedCard extends StatefulWidget {
  final String text;
  final double maxWidth;

  const AnimatedCard({super.key, required this.text, this.maxWidth = 600.0});

  @override
  AnimatedCardState createState() => AnimatedCardState();
}

class AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _opacityAnimation = Tween<double>(
      begin: 0.39,
      end: 0.6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (_isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
            onTap: () {},
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    elevation: 6.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [darkOlive, rifleGreen],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: lightOlive, width: 2.0),
                        borderRadius: BorderRadius.circular(9.0),
                        boxShadow: [
                          BoxShadow(
                            color: lime100.withValues(alpha: 0.3),
                            blurRadius: 6.0,
                            spreadRadius: 1.0,
                            offset: const Offset(0, 3.0),
                          ),
                        ],
                      ),
                      child: InkWell(
                        hoverColor: lightGreen100.withOpacity(
                          _opacityAnimation.value,
                        ),
                        splashColor: lightGreen100,
                        highlightColor: lightGreen100.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(9.0),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            widget.text,
                            style: GoogleFonts.ubuntuMono(
                              color: lightGreen100,
                              //fontWeight: FontWeight.w600,
                              letterSpacing: 0.6,
                              //fontSize: 19.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
