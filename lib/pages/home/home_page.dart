import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash_border_animated/flutter_dash_border_animated.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/pages/about/about_page.dart';
import 'package:koidio_ble/pages/consultancy/consultancy_page.dart';
import 'package:koidio_ble/pages/contact/contact_page.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:koidio_ble/widgets/my_connect_with_me.dart';
import 'package:koidio_ble/widgets/my_divider.dart';
import 'package:koidio_ble/widgets/my_drawer.dart';
import 'package:koidio_ble/widgets/my_signature.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Hover states for AppBar and section cards
  bool _isDrawerHovered = false;
  bool _isAboutAppBarHovered = false;
  bool _isSkillsAppBarHovered = false;
  bool _isProjectsAppBarHovered = false;
  bool _isContactAppBarHovered = false;
  bool _isAboutHovered = false;
  bool _isWhoAmIHovered = false;
  bool _isConsultancyHovered = false;
  bool _isWhatIDoHovered = false;
  bool _isContactHovered = false;
  bool _showBackToTop = false;
  bool _isSendMessageHovered = false;
  bool _isAppBarVisible = true;
  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 1024;
  }

  // Tracks the previous scroll position to determine scroll direction.
  double _lastScrollOffset = 0.0;

  late AnimationController _animationController;
  late ScrollController _scrollController;

  // Unique GlobalKeys for each section
  final GlobalKey _fullStackSectionKey = GlobalKey();
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (mounted) {
        // Handle both back-to-top button and appbar visibility
        setState(() {
          _showBackToTop = _scrollController.offset > 200;
        });
        // Handle appBar visility
        _handleScroll();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() async {
    final currentScroll = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;

    // If scrolling UP or at the TOP → Show AppBar
    if (currentScroll <= 0 || currentScroll < _lastScrollOffset) {
      if (!_isAppBarVisible) {
        setState(() => _isAppBarVisible = true);
      }
    }
    // If scrolling DOWN past 100px → Hide AppBar
    else if (currentScroll > 100 &&
        currentScroll > _lastScrollOffset &&
        currentScroll < maxScroll - 200) {
      if (_isAppBarVisible) {
        setState(() => _isAppBarVisible = false);
      }
    }
    // Update last scroll position for the next comparison
    _lastScrollOffset = currentScroll;
  }

  // Scroll to a section using GlobalKey
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      drawer:
          _isMobile(context)
              ? MyDrawer(
                scrollController: _scrollController,
                projectsKey: _projectsSectionKey,
              )
              : null,
      body: MouseRegion(
        cursor: SystemMouseCursors.grab,

        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [darkOlive, midOlive],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              //  ParticleBackground(animationController: _animationController),
              RawScrollbar(
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
                  child: Column(
                    children: [
                      _buildMainContent(context),
                      const SizedBox(height: 33.0),
                      const MyDivider(),
                      const SizedBox(height: 16.0),
                      const MySignature(),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ],
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
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isDesktop = width >= 1024;
    if (isDesktop) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AnimatedSlide(
          offset: _isAppBarVisible ? Offset.zero : Offset(0, -1),
          duration: const Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [rifleGreen, transparentColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Image.asset(
                      'assets/logo/512_white_bk_inverted.png',
                      height: 69.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAppBarItem(
                        text: 'About',
                        isHovered: _isAboutAppBarHovered,
                        onEnter:
                            () => setState(() => _isAboutAppBarHovered = true),
                        onExit:
                            () => setState(() => _isAboutAppBarHovered = false),
                        onTap: () => _scrollToSection(_aboutSectionKey),
                      ),
                      _buildAppBarItem(
                        text: 'Skills',
                        isHovered: _isSkillsAppBarHovered,
                        onEnter:
                            () => setState(() => _isSkillsAppBarHovered = true),
                        onExit:
                            () =>
                                setState(() => _isSkillsAppBarHovered = false),
                        onTap: () => _scrollToSection(_skillsSectionKey),
                      ),
                      _buildAppBarItem(
                        text: 'Contact',
                        isHovered: _isContactAppBarHovered,
                        onEnter:
                            () =>
                                setState(() => _isContactAppBarHovered = true),
                        onExit:
                            () =>
                                setState(() => _isContactAppBarHovered = false),
                        onTap: () => _scrollToSection(_contactSectionKey),
                      ),
                      _buildAppBarItem(
                        text: 'Projects',
                        isHovered: _isProjectsAppBarHovered,
                        onEnter:
                            () =>
                                setState(() => _isProjectsAppBarHovered = true),
                        onExit:
                            () => setState(
                              () => _isProjectsAppBarHovered = false,
                            ),
                        onTap: () => _scrollToSection(_projectsSectionKey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    // For mobile, return an empty PreferredSize to avoid returning null or an invalid widget.
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [rifleGreen, transparentColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          backgroundColor: transparentColor,
          leading: Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: MouseRegion(
                    onEnter: (event) => setState(() => _isDrawerHovered = true),
                    onExit: (event) => setState(() => _isDrawerHovered = false),
                    child: FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      color: _isDrawerHovered ? white : seafoamGreen,
                    ),
                  ),
                ),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildAppBarItem({
    required String text,
    required bool isHovered,
    required VoidCallback onEnter,
    required VoidCallback onExit,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        hoverColor: canaryYellow,
        onTap: onTap,
        child: MouseRegion(
          onEnter: (_) => onEnter(),
          onExit: (_) => onExit(),
          child: Container(
            decoration: BoxDecoration(border: Border.all(), color: darkOlive),
            child: Text(
              text,
              style: GoogleFonts.ubuntu(
                color: isHovered ? oliveDrab : white,
                fontWeight: FontWeight.w600,
                letterSpacing: 3.0,
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
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        _buildHeaderSection(context),
        _buildFullStackSection(context, key: _fullStackSectionKey),
        const SizedBox(height: 166.0),
        MyDivider(),
        const SizedBox(height: 166.0),
        _buildAboutSection(context, key: _aboutSectionKey),
        const SizedBox(height: 166.0),
        MyDivider(),
        const SizedBox(height: 166.0),
        _buildConsultancySection(context, key: _skillsSectionKey),
        const SizedBox(height: 166.0),
        MyDivider(),
        const SizedBox(height: 166.0),
        _buildContactSection(context, key: _contactSectionKey),
        const SizedBox(height: 90.0),
        ConnectWithMe(),
        const SizedBox(height: 90.0),
        MyDivider(),
        const SizedBox(height: 166.0),
        _buildProjectsSection(context, key: _projectsSectionKey),
        const SizedBox(height: 300.0),
      ],
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: lightOlive.withValues(alpha: 0.3),
                  blurRadius: 20.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13.0),
              child: Image.asset("assets/logo/bk_logo.png", scale: 3.9),
            ),
          ),
          const SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Hello World!",
                      textStyle: TextStyle(color: white, fontSize: 19.0),
                      speed: Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "I am",
                  style: GoogleFonts.ubuntu(color: white, fontSize: 19.0),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  'KOIDIO Y. BLÉ',
                  style: GoogleFonts.courierPrime(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),

              Text(
                "COMPUTER ENGINEER",
                style: GoogleFonts.ubuntu(
                  color: turquoise,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: turquoise.withValues(alpha: 0.3),
                  decorationThickness: 3.0,
                ),
              ),

              Text(
                "Specialization ",
                style: GoogleFonts.ubuntu(
                  color: cornsilk,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Full-Stack Developer",
                style: GoogleFonts.ubuntu(
                  color: seafoamGreen,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: seafoamGreen.withValues(alpha: 0.3),
                  decorationThickness: 3.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFullStackSection(BuildContext context, {Key? key}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    return Padding(
      key: key,
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          DashBorderAnimated(
            dashColor: turquoise,
            child: Container(
              width: isDesktop ? 666.0 : 333.0,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.cyanAccent.withValues(alpha: 0.03),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withValues(alpha: 0.05),
                    blurRadius: 15.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.computer, color: darkCyan),
                    Text(
                      'Computer and Electronics Engineering',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w600,
                        color: Colors.cyanAccent,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "I’m a developer and engineer passionate about crafting innovative mobile, web, desktop, and hardware solutions, fueled by emerging technologies.",
                      style: GoogleFonts.ubuntu(color: white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    Icon(Icons.engineering, color: darkCyan),
                    Text(
                      'Engineering',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w600,
                        color: Colors.cyanAccent,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'I use engineering principles to Construct, Design, Develop, Test, and Maintain Programs.',
                      style: GoogleFonts.ubuntu(color: white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context, {Key? key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(16.0),
      child: _buildSectionCard(
        context,
        imagePath: 'assets/pics/about1.png',
        icon: Icons.info_outlined,
        title: 'ABOUT\nFind out more about me',
        subtitle: 'who am I.',
        isHoveredTitle: _isAboutHovered,
        isHoveredSubtitle: _isWhoAmIHovered,
        onTitleHover: (hovered) => setState(() => _isAboutHovered = hovered),
        onSubtitleHover:
            (hovered) => setState(() => _isWhoAmIHovered = hovered),
        onTap:
            () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              ),
            },
      ),
    );
  }

  Widget _buildConsultancySection(BuildContext context, {Key? key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(16.0),
      child: _buildSectionCard(
        context,
        imagePath: 'assets/pics/consultant2_min.png',
        icon: Icons.work_history_outlined,
        title: 'SKILLS\nLearn more about',
        subtitle: 'what I do.',
        isHoveredTitle: _isConsultancyHovered,
        isHoveredSubtitle: _isWhatIDoHovered,
        onTitleHover:
            (hovered) => setState(() => _isConsultancyHovered = hovered),
        onSubtitleHover:
            (hovered) => setState(() => _isWhatIDoHovered = hovered),
        onTap:
            () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsultancyPage()),
              ),
            },
      ),
    );
  }

  Widget _buildContactSection(BuildContext context, {Key? key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(16.0),
      child: _buildSectionCard(
        context,
        imagePath: 'assets/pics/contact3_min.png',
        icon: Icons.contact_support_outlined,
        title: 'CONTACT\nWant to get in touch?',
        subtitle: 'send me a message.',
        isHoveredTitle: _isContactHovered,
        isHoveredSubtitle: _isSendMessageHovered,
        onTitleHover: (hovered) => setState(() => _isContactHovered = hovered),
        onSubtitleHover:
            (hovered) => setState(() => _isSendMessageHovered = hovered),
        onTap:
            () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactPage()),
              ),
            },
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String imagePath,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isHoveredTitle,
    required bool isHoveredSubtitle,
    required ValueChanged<bool> onTitleHover,
    required ValueChanged<bool> onSubtitleHover,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withValues(alpha: 0.3),
            blurRadius: 20.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Card(
        elevation: 0.0,
        color: transparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            height: 300.0,
            width: isDesktop ? 666.0 : 333.0,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  black.withValues(alpha: 0.4),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(icon, size: 40.0, color: Colors.cyanAccent),
                  onPressed: onTap,
                  splashColor: Colors.cyanAccent.withValues(alpha: 0.3),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      onEnter: (_) => onTitleHover(true),
                      onExit: (_) => onTitleHover(false),
                      child: GestureDetector(
                        onTap: onTap,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color:
                                isHoveredTitle
                                    ? Colors.cyanAccent.withValues(alpha: 0.2)
                                    : black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.cyanAccent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            title,
                            style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.cyanAccent.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    MouseRegion(
                      onEnter: (_) => onSubtitleHover(true),
                      onExit: (_) => onSubtitleHover(false),
                      child: GestureDetector(
                        onTap: onTap,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color:
                                isHoveredSubtitle
                                    ? Colors.cyanAccent.withValues(alpha: 0.2)
                                    : black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.cyanAccent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            subtitle,
                            style: GoogleFonts.ubuntu(
                              color: Colors.white70,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context, {Key? key}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    return Padding(
      key: key,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Tooltip(
            message:
                'Explore my research projects, including innovative tools and applications.',
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: black.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.cyanAccent.withValues(alpha: 0.5),
              ),
            ),
            textStyle: const TextStyle(color: Colors.white, fontSize: 14.0),
            child: Text(
              'PROJECTS RESEARCH',
              style: GoogleFonts.ubuntu(
                color: Colors.cyanAccent,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: Colors.cyanAccent.withValues(alpha: 0.7),
                decorationThickness: 2.0,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: isDesktop ? 666.0 : 333.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.cyanAccent.withValues(alpha: 0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyanAccent.withValues(alpha: 0.2),
                  blurRadius: 15.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: ExpansionTile(
              expandedAlignment: Alignment.center,
              initiallyExpanded: true,
              title: Center(
                child: Text(
                  'Few recent projects',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              backgroundColor: black.withValues(alpha: 0.3),
              collapsedBackgroundColor: black.withValues(alpha: 0.1),
              textColor: white,
              iconColor: white,
              collapsedTextColor: white,
              collapsedIconColor: white,
              children: [
                _buildProjectTile(
                  context,
                  title: 'Siikaa Currency Converter',
                  imagePath: 'assets/logo/128_siikaa.png',
                  description:
                      'Siikaa is a user-friendly currency conversion app supporting over 100 currencies. It provides real-time exchange rates sourced from trusted APIs, enabling quick and accurate conversions. Features like "Fast Swap" make it ideal for travelers, freelancers, and anyone handling international payments.',
                  url: 'https://www.sii-kaa.com',
                  whyBuilt:
                      'As an international traveler, I frequently needed to convert currencies based on my location, often resorting to online tools. Even in regions using the US dollar, I wanted to compare prices to my home currency, XOF (West African CFA franc), for better financial decisions. Additionally, evaluating investments or stock market opportunities required quick and reliable currency conversions. I built Siikaa to simplify these tasks, providing a fast, intuitive tool for travelers, investors, and anyone needing accurate currency conversions on the go.',
                  advantages: [
                    'Simplicity: Intuitive interface for effortless currency conversions.',
                    'Speed: Real-time rates and "Fast Swap" feature for quick checks.',
                    'Good reach: Supports over 100 currencies, perfect for international use.',
                    'Reliability: Powered by trusted APIs for accurate and up-to-date data.',
                  ],
                  resources: [
                    'Exchange Rate APIs: Leverages reliable APIs like Open Exchange Rates for real-time data.',
                    'Flutter Framework: Flutter for cross-platform compatibility and smooth performance.',
                    'Firebase: Uses Firebase for secure hosting and analytics to enhance user experience.',
                    'Currency Data: Currency data organized by continents, accessible in-app.',
                  ],
                  technicalDetails: [
                    'cloud_firestore: For real-time database integration.',
                    'country_flags: Displays country flags for currency selection.',
                    'country_pickers: Enhances user interface for selecting countries.',
                    'currency_picker: Simplifies currency selection.',
                    'equatable: Ensures reliable state comparison in Flutter Bloc.',
                    'firebase_analytics: Tracks user interactions for better insights.',
                    'firebase_core: Core Firebase integration for app services.',
                    'flutter_bloc: Manages state with a robust architecture.',
                    'flutter_inappwebview: Enables in-app web browsing.',
                    'google_fonts: Provides custom typography with Afacad fonts.',
                    'google_mobile_ads: Integrates ads for monetization.',
                    'http: Handles API requests for exchange rates.',
                    'intl: Formats numbers and currencies appropriately.',
                    'shared_preferences: Stores user preferences locally.',
                    'syncfusion_flutter_charts: Visualizes currency trends with charts.',
                    'url_launcher: Opens external links like the Siikaa website.',
                    'webview_all & webview_flutter: Supports web content display.',
                    'assets: Include custom fonts, icons, and a JSON file for currency history.',
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Divider(
                    color: Colors.cyanAccent.withValues(alpha: 0.3),
                  ),
                ),

                // _buildProjectTile(
                //   context,
                //   title: 'Portfolio (Legacy)',
                //   imagePath: 'assets/logo/bled_logo512.png',
                //   description:
                //       'Portfolio (Legacy) is an early version of my personal portfolio website, showcasing my initial projects and skills as a developer. Hosted on GitHub Pages, it highlights my journey in web development with a clean and responsive design.',
                //   url: 'https://koidioble.github.io/portfolio/',
                //   whyBuilt:
                //       'As a budding developer, I wanted a platform to showcase my projects and skills to potential clients and employers. This portfolio served as my first step in establishing an online presence, allowing me to experiment with web development technologies and design principles.',
                //   advantages: [
                //     'Simplicity: Clean and minimalistic design for easy navigation.',
                //     'Responsiveness: Optimized for both desktop and mobile devices.',
                //     'Showcase: Effectively highlights my early projects and skills.',
                //     'Accessibility: Hosted on GitHub Pages for reliable access.',
                //   ],
                //   resources: [
                //     'HTML/CSS/JavaScript: Core web technologies for building the site.',
                //     'GitHub Pages: Reliable hosting platform.',
                //     'Bootstrap: For responsive design and UI components.',
                //   ],
                //   technicalDetails: [
                //     'HTML5: For structuring the website content.',
                //     'CSS3: For styling and responsive design.',
                //     'JavaScript: For interactive elements and dynamic content.',
                //     'Bootstrap: For pre-built components and responsive grid system.',
                //     'GitHub Pages: For hosting and deployment.',
                //   ],
                // ),
                // Center(
                //   child: AnimatedBuilder(
                //     animation: _animationController,
                //     builder: (context, child) {
                //       return Opacity(
                //         opacity: _opacityAnimation.value,
                //         child: Transform.scale(
                //           scale: _scaleAnimation.value,
                //           child: Padding(
                //             padding: const EdgeInsets.all(30.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.all(3.0),
                //                   child: Icon(Icons.code, color: white),
                //                 ),

                //                 Text(
                //                   'In the Lab!',
                //                   style: GoogleFonts.ubuntuMono(
                //                     fontStyle: FontStyle.italic,
                //                     color: white,
                //                     fontSize: 16.0,
                //                   ),
                //                   textAlign: TextAlign.center,
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.all(3.0),
                //                   child: Icon(Icons.code, color: white),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectTile(
    BuildContext context, {
    required String title,
    required String imagePath,
    required String description,
    required String url,
    required String whyBuilt,
    required List<String> advantages,
    required List<String> resources,
    required List<String> technicalDetails,
  }) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        title,
        style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w600,
          color: Colors.cyanAccent,
          fontSize: 18.0,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: black.withValues(alpha: 0.3),
      collapsedBackgroundColor: black.withValues(alpha: 0.1),

      textColor: white,
      iconColor: Colors.cyanAccent,
      collapsedTextColor: white,
      collapsedIconColor: Colors.cyanAccent,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 90.0,
                    height: 90.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                title,
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  color: white,
                  fontSize: 19.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Text(
                description,
                style: GoogleFonts.ubuntu(color: Colors.white70),
              ),
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: () => _launchUrl(url),
                child: Text(
                  'Visit $title: $url',
                  style: GoogleFonts.ubuntu(
                    color: Colors.cyanAccent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.cyanAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Why I Built $title',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  color: Colors.cyanAccent,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(whyBuilt, style: GoogleFonts.ubuntu(color: Colors.white70)),
              const SizedBox(height: 20.0),
              Text(
                'Advantages of $title',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  color: Colors.cyanAccent,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10.0),
              ...advantages.map(
                (advantage) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '- $advantage',
                    style: GoogleFonts.ubuntu(color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Trusted Resources',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  color: Colors.cyanAccent,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10.0),
              ...resources.map(
                (resource) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '- $resource',
                    style: GoogleFonts.ubuntu(color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Technical Details',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600,
                  color: Colors.cyanAccent,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10.0),
              ...technicalDetails.map(
                (detail) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '- $detail',
                    style: GoogleFonts.ubuntu(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }
}

// class ParticleBackground extends StatelessWidget {
//   final AnimationController animationController;

//   const ParticleBackground({super.key, required this.animationController});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animationController,
//       builder: (context, child) {
//         return CustomPaint(
//           painter: ParticlePainter(animationController.value),
//           size: Size.infinite,
//         );
//       },
//     );
//   }
// }

class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(0);
    final paint =
        Paint()
          ..color = canaryYellow.withValues(alpha: 0.3)
          ..style = PaintingStyle.fill;

    for (int i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y =
          (random.nextDouble() * size.height + animationValue * size.height) %
          size.height;
      final radius = random.nextDouble() * 2 + 1;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
