import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/pages/about/about_page.dart';
import 'package:koidio_ble/pages/consultancy/consultancy_page.dart';
import 'package:koidio_ble/pages/contact/contact_page.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_connect_with_me.dart';
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkOlive.withValues(alpha: .9),
      child: Column(
        children: [
          Container(
            color: darkOlive,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Close drawer
                    },
                    icon: Icon(Icons.menu_outlined, color: white, size: 33.0),
                  ),
                ),
              ],
            ),
          ),
          DrawerHeader(
            decoration: BoxDecoration(color: darkOlive),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/512_white_bk_inverted.png',
                    height: 99.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'KOIDIO Y. BLÉ',
                    style: TextStyle(
                      color: white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
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
                        color: _isAboutHovered ? canaryYellow : white,
                      ),
                      title: Center(
                        child: Text(
                          'About',
                          style: GoogleFonts.ubuntu(
                            color: _isAboutHovered ? canaryYellow : white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: _isAboutHovered ? canaryYellow : white,
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
                MouseRegion(
                  onEnter: (_) => setState(() => _isConsultancyHovered = true),
                  onExit: (_) => setState(() => _isConsultancyHovered = false),
                  child: ListTile(
                    leading: Icon(
                      Icons.work_history_outlined,
                      color: _isConsultancyHovered ? canaryYellow : white,
                    ),
                    title: Text(
                      'Consultancy',
                      style: GoogleFonts.ubuntu(
                        color: _isConsultancyHovered ? canaryYellow : white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: _isConsultancyHovered ? canaryYellow : white,
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
                MouseRegion(
                  onEnter: (_) => setState(() => _isContactHovered = true),
                  onExit: (_) => setState(() => _isContactHovered = false),
                  child: ListTile(
                    leading: Icon(
                      Icons.contact_support_outlined,
                      color: _isContactHovered ? canaryYellow : white,
                    ),
                    title: Text(
                      'Contact',
                      style: GoogleFonts.ubuntu(
                        color: _isContactHovered ? canaryYellow : white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                      color: _isContactHovered ? canaryYellow : white,
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
                StatefulBuilder(
                  builder: (context, setState) {
                    return MouseRegion(
                      onEnter: (_) => setState(() => _isProjectsHovered = true),
                      onExit: (_) => setState(() => _isProjectsHovered = false),
                      child: ListTile(
                        leading: Icon(
                          Icons.code,
                          color: _isProjectsHovered ? canaryYellow : white,
                        ),
                        title: Text(
                          'The Projects',
                          style: GoogleFonts.ubuntu(
                            color: _isProjectsHovered ? canaryYellow : white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: _isProjectsHovered ? canaryYellow : white,
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
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0),
            child: ConnectWithMe(),
          ),
          MySignature(),
        ],
      ),
    );
  }
}
