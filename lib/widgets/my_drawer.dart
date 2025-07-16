import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/pages/about/about_page.dart';
import 'package:koidio_ble/pages/consultancy/consultancy_page.dart';
import 'package:koidio_ble/pages/contact/contact_page.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_connect_with_me.dart';
import 'package:koidio_ble/widgets/my_divider.dart';
import 'package:koidio_ble/widgets/my_signature.dart';

class MyDrawer extends StatefulWidget {
  final ScrollController scrollController; // Accept ScrollController
  final GlobalKey projectsKey; // Accept GlobalKey
  const MyDrawer({
    super.key,
    required this.scrollController,
    required this.projectsKey,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isConsultancyHovered = false;
  bool _isAboutHovered = false;
  bool _isContactHovered = false;
  bool _isProjectsHovered = false;
  bool _isDrawerHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Container(
              color: darkOlive,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isDrawerHovered = true),
                      onExit: (_) => setState(() => _isDrawerHovered = false),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Close drawer
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.barsStaggered,
                          color: _isDrawerHovered ? white : oliveDrab,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DrawerHeader(
              decoration: BoxDecoration(color: black.withValues(alpha: 0.69)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/512_white_bk_inverted.png',
                      height: 69.0,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 3.0),
                    Text(
                      'KOIDIO Y. BLÉ',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: darkOlive,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => _isAboutHovered = true),
                      onExit: (_) => setState(() => _isAboutHovered = false),
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: _isAboutHovered ? oliveDrab : white,
                          ),
                          title: Center(
                            child: Text(
                              'About',
                              style: GoogleFonts.ubuntu(
                                color: _isAboutHovered ? oliveDrab : white,
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: _isAboutHovered ? oliveDrab : white,
                            size: 13.0,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(),
                    MouseRegion(
                      onEnter:
                          (_) => setState(() => _isConsultancyHovered = true),
                      onExit:
                          (_) => setState(() => _isConsultancyHovered = false),
                      child: ListTile(
                        leading: Icon(
                          Icons.work_history_outlined,
                          color: _isConsultancyHovered ? oliveDrab : white,
                        ),
                        title: Text(
                          'Skills',
                          style: GoogleFonts.ubuntu(
                            color: _isConsultancyHovered ? oliveDrab : white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: _isConsultancyHovered ? oliveDrab : white,
                          size: 13.0,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConsultancyPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isContactHovered = true),
                      onExit: (_) => setState(() => _isContactHovered = false),
                      child: ListTile(
                        leading: Icon(
                          Icons.contact_support_outlined,
                          color: _isContactHovered ? oliveDrab : white,
                        ),
                        title: Text(
                          'Contact',
                          style: GoogleFonts.ubuntu(
                            color: _isContactHovered ? oliveDrab : white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: _isContactHovered ? oliveDrab : white,
                          size: 13.0,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return MouseRegion(
                          onEnter:
                              (_) => setState(() => _isProjectsHovered = true),
                          onExit:
                              (_) => setState(() => _isProjectsHovered = false),
                          child: ListTile(
                            leading: Icon(
                              Icons.code,
                              color: _isProjectsHovered ? oliveDrab : white,
                            ),
                            title: Text(
                              'Projects',
                              style: GoogleFonts.ubuntu(
                                color: _isProjectsHovered ? oliveDrab : white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: _isProjectsHovered ? oliveDrab : white,
                              size: 13.0,
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close drawer
                              final RenderObject? renderObject =
                                  widget.projectsKey.currentContext
                                      ?.findRenderObject();
                              if (renderObject != null &&
                                  renderObject is RenderBox) {
                                final position =
                                    renderObject.localToGlobal(Offset.zero).dy;
                                final adjustedPosition =
                                    position -
                                    kToolbarHeight -
                                    MediaQuery.of(context).padding.top;
                                widget.scrollController.animateTo(
                                  adjustedPosition,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: darkOlive,
              child: Padding(
                padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                child: Column(children: [ConnectWithMe(), MySignature()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
