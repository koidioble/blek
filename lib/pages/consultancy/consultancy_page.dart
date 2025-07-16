import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/consultancy/mobile_development_page.dart';
import 'package:koidio_ble/pages/consultancy/software_development_page.dart';
import 'package:koidio_ble/pages/consultancy/web_development_page.dart';
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
  bool _isSkillsHovered = false;

  @override
  void dispose() {
    _controllerPageView.dispose();
    super.dispose();
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
            onPressed: () => Navigator.pop(context),
          ),
          title: InkWell(
            hoverColor: midOlive.withValues(alpha: 0.39),
            onTap: () {},
            child: MouseRegion(
              onEnter: (event) => setState(() => _isSkillsHovered = true),
              onExit: (event) => setState(() => _isSkillsHovered = false),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Skills",
                  style: TextStyle(
                    color: _isSkillsHovered ? oliveDrab : white,
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
        // Remove the scaffold background color
        backgroundColor: darkCyan.withValues(alpha: 0.69),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  child: Center(
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
                            maxWidth: MediaQuery.sizeOf(context).width,
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16.0),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: PageView(
                                  scrollDirection: Axis.vertical,
                                  controller: _controllerPageView,
                                  physics: const ClampingScrollPhysics(),
                                  onPageChanged: (index) {
                                    debugPrint('Page ${index + 1}');
                                  },
                                  children: const [
                                    WebDevelopmentPage(),
                                    MobileDevelopmentPage(),
                                    SoftwareDevelopmentPage(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
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
                                        Icons.keyboard_arrow_up,
                                        color: turquoise,
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
                                        Icons.keyboard_arrow_down,
                                        color: turquoise,
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
