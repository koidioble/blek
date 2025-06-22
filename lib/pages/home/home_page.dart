import 'package:flutter/material.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  final String facebookUrl = 'https://www.facebook.com/spion225/';
  final String instagramUrl = 'https://www.instagram.com/koidioble/';
  final String linkedinUrl = 'https://www.linkedin.com/in/koidioyble/';
  final String githubUrl = 'https://github.com/koidioble';
  final ScrollController _scrollController =
      ScrollController(); // Add ScrollController
  final GlobalKey _projectsKey =
      GlobalKey(); // Add GlobalKey for projects section
  bool _isConsultancyHovered = false;
  bool _isWhatIDoHovered = false;
  bool _isAboutHovered = false;
  bool _isWhoAmIHovered = false;
  bool _isContactHovered = false;
  bool _isSendMessageHovered = false;
  bool _isConsultancyTextHovered = false;
  bool _isContactTextHovered = false;
  bool _isAboutTextHovered = false;
  bool _isSiikaaHovered = false;
  bool _isLegacyHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _opacityAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                iconSize: 33.0,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        backgroundColor: white,
        title: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.width * 0.1).clamp(
                60.0,
                100.0,
              ),
              child: Image.asset(
                "assets/logo/300_white_bk.png",
                scale:
                    MediaQuery.of(context).size.width < 10
                        ? 2.0
                        : 10 / MediaQuery.of(context).size.width * 2.0,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(9.0),
          child: Text(
            'KOIDIO Y. BLÉ',
            style: GoogleFonts.ubuntu(
              color: darkOlive,
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        centerTitle: true,
      ),
      drawer: MyDrawer(
        scrollController: _scrollController, // Pass ScrollController
        projectsKey: _projectsKey, // Pass GlobalKey for projects section
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Assign ScrollController
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Center(
                      child: SizedBox(
                        width: 666.0,
                        child: InkWell(
                          hoverColor: lightOlive,
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              "assets/logo/bk_logo.png",
                              scale: 0.9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'KOIDIO Y. BLÉ',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                            color: darkOlive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Tooltip(
                          message:
                              'A full-Stack developer is a programmer who can work on both the front-end (client-side) and back-end (server-side) of an application or website.',
                          padding: const EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            color: black,
                            border: Border.all(
                              color: canaryYellow.withValues(alpha: 0.69),
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          textStyle: TextStyle(color: lime100),
                          child: Text(
                            'FULL-STACK DEVELOPER',
                            style: GoogleFonts.ubuntuMono(
                              color: midOlive,
                              fontSize: 19.0,
                              decoration: TextDecoration.underline,
                              decorationColor: midOlive,
                              decorationThickness: 3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: lightOlive),
                            borderRadius: BorderRadius.circular(3.0),
                            color: rifleGreen,
                          ),
                          width: 666.0,
                          child: ExpansionTile(
                            title: Center(
                              child: Text(
                                'Learn More About my Full-Stack Development Skills',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: lightGreen100,
                                ),
                              ),
                            ),
                            backgroundColor: rifleGreen.withValues(alpha: 0.3),
                            collapsedBackgroundColor: rifleGreen.withValues(
                              alpha: 0.6,
                            ),
                            textColor: lime100,
                            iconColor: lightCoral,
                            collapsedTextColor: lime100,
                            collapsedIconColor: lime300,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Is a Full-Stack Developer an Engineer?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lime100,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 9.0),
                                    Text(
                                      'Yes, a full-stack developer is a high-level engineer who creates, tests, and executes multiple software applications. We develop websites, apps, and software and oversee coding teams to enhance productivity.',
                                      style: TextStyle(color: lime100),
                                    ),
                                    SizedBox(height: 16.0),
                                    Text(
                                      'Is a Full-Stack Developer a Software Engineer?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lime100,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 9.0),
                                    Text(
                                      'Yes, a full-stack developer is a type of software engineer. Full-stack developers are software engineers with a specialized skillset that encompasses both front-end (user interface) and back-end (server-side logic) development. While all full-stack developers are software engineers, not all software engineers are full-stack developers.',
                                      style: TextStyle(color: lime100),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // ROW ONE KOIDIO Y BLE END

                  /// ABOUT PAGE ///
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: InkWell(
                            hoverColor: darkOlive.withValues(alpha: 0.69),
                            onTap: () {},
                            child: Card(
                              elevation: 9.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              color: lightOlive,
                              child: Container(
                                height: 300.0,
                                width: 666.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightOlive),
                                  borderRadius: BorderRadius.circular(3.0),
                                  image: DecorationImage(
                                    image: AssetImage('assets/pics/about1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.black.withValues(
                                    alpha: 0.3,
                                  ), // Overlay for readability
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
                                            hoverColor: rifleGreen.withValues(
                                              alpha: 0.6,
                                            ),
                                            color: lightGreen100,
                                            icon: const Icon(
                                              Icons.info_outlined,
                                              size: 39.0,
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
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: <Widget>[
                                                MouseRegion(
                                                  onEnter:
                                                      (_) => setState(
                                                        () =>
                                                            _isAboutHovered =
                                                                true,
                                                      ),
                                                  onExit:
                                                      (_) => setState(
                                                        () =>
                                                            _isAboutHovered =
                                                                false,
                                                      ),
                                                  child: InkWell(
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                            3.0,
                                                          ),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                transparentColor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                3.0,
                                                              ),
                                                          color:
                                                              _isAboutHovered
                                                                  ? lightOlive
                                                                  : rifleGreen
                                                                      .withValues(
                                                                        alpha:
                                                                            0.6,
                                                                      ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                3.0,
                                                              ),
                                                          child: Text(
                                                            'ABOUT\nFind out more about me',
                                                            style: TextStyle(
                                                              color: green100,
                                                              fontSize: 16.0,
                                                              shadows: [
                                                                Shadow(
                                                                  blurRadius:
                                                                      2.0,
                                                                  color:
                                                                      Colors
                                                                          .black,
                                                                  offset:
                                                                      Offset(
                                                                        1.0,
                                                                        1.0,
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
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              MouseRegion(
                                                onEnter:
                                                    (_) => setState(
                                                      () =>
                                                          _isWhoAmIHovered =
                                                              true,
                                                    ),
                                                onExit:
                                                    (_) => setState(
                                                      () =>
                                                          _isWhoAmIHovered =
                                                              false,
                                                    ),
                                                child: InkWell(
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                          3.0,
                                                        ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              transparentColor,
                                                        ),
                                                        color:
                                                            _isWhoAmIHovered
                                                                ? midOlive // Hover color
                                                                : lightGreen300
                                                                    .withValues(
                                                                      alpha:
                                                                          0.6,
                                                                    ), // Normal color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              3.0,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              3.0,
                                                            ),
                                                        child: Text(
                                                          'who am I.',
                                                          style: TextStyle(
                                                            color: lime100,
                                                            fontSize: 16.0,
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 2.0,
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
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
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: MouseRegion(
                            onEnter:
                                (_) =>
                                    setState(() => _isAboutTextHovered = true),
                            onExit:
                                (_) =>
                                    setState(() => _isAboutTextHovered = false),
                            child: SizedBox(
                              width: 666.0,
                              child: InkWell(
                                hoverColor: transparentColor,
                                focusColor: transparentColor,
                                highlightColor: transparentColor,
                                splashColor: transparentColor,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AboutPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "My journey in software development has equipped me with a diverse skill set, enabling me to tackle complex challenges and deliver high-quality solutions.",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color:
                                        _isAboutTextHovered
                                            ? lightOlive
                                            : darkOlive,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  /// ABOUT PAGE END //
                  /// CONSULTANCY ///
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: InkWell(
                            hoverColor: darkOlive.withValues(alpha: 0.69),
                            onTap: () {},
                            child: Card(
                              elevation: 9.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              color: lightOlive,
                              child: Container(
                                height: 300.0,
                                width: 666.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightOlive),
                                  borderRadius: BorderRadius.circular(3.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/pics/consultant2_min.png',
                                    ),
                                    fit:
                                        BoxFit
                                            .cover, // Stretches image to fill entire 999x300px space
                                  ),
                                  color: Colors.black.withValues(
                                    alpha: 0.3,
                                  ), // Overlay for readability
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
                                            hoverColor: rifleGreen.withValues(
                                              alpha: 0.6,
                                            ),
                                            color: lightGreen100,
                                            icon: const Icon(
                                              Icons.work_history_outlined,
                                              size: 39.0,
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
                                              MouseRegion(
                                                onEnter:
                                                    (_) => setState(
                                                      () =>
                                                          _isConsultancyHovered =
                                                              true,
                                                    ),
                                                onExit:
                                                    (_) => setState(
                                                      () =>
                                                          _isConsultancyHovered =
                                                              false,
                                                    ),
                                                child: InkWell(
                                                  hoverColor:
                                                      transparentColor, // Disable InkWell's default hover
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                          3.0,
                                                        ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              transparentColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              3.0,
                                                            ),
                                                        color:
                                                            _isConsultancyHovered
                                                                ? lightOlive // Hover color
                                                                : rifleGreen
                                                                    .withValues(
                                                                      alpha:
                                                                          0.6,
                                                                    ), // Normal color
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              3.0,
                                                            ),
                                                        child: Text(
                                                          'CONSULTANCY\nLearn more about',
                                                          style: TextStyle(
                                                            color: green100,
                                                            fontSize: 16.0,
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 2.0,
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
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
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              MouseRegion(
                                                onEnter:
                                                    (_) => setState(
                                                      () =>
                                                          _isWhatIDoHovered =
                                                              true,
                                                    ),
                                                onExit:
                                                    (_) => setState(
                                                      () =>
                                                          _isWhatIDoHovered =
                                                              false,
                                                    ),
                                                child: InkWell(
                                                  hoverColor:
                                                      Colors.transparent,
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                          3.0,
                                                        ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              transparentColor,
                                                        ),
                                                        color:
                                                            _isWhatIDoHovered
                                                                ? midOlive // Hover color
                                                                : lightGreen300
                                                                    .withValues(
                                                                      alpha:
                                                                          0.6,
                                                                    ), // Normal color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              3.0,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              3.0,
                                                            ),
                                                        child: Text(
                                                          'what I do.',
                                                          style: TextStyle(
                                                            color: lime100,
                                                            fontSize: 16.0,
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 2.0,
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
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
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: MouseRegion(
                            onEnter:
                                (_) => setState(
                                  () => _isConsultancyTextHovered = true,
                                ),
                            onExit:
                                (_) => setState(
                                  () => _isConsultancyTextHovered = false,
                                ),
                            child: SizedBox(
                              width: 666.0,
                              child: InkWell(
                                hoverColor: transparentColor,
                                focusColor: transparentColor,
                                highlightColor: transparentColor,
                                splashColor: transparentColor,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const ConsultancyPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "I offer consultancy services to help businesses and individuals build robust, scalable, and user-friendly applications.",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color:
                                        _isConsultancyTextHovered
                                            ? lightOlive
                                            : darkOlive,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  ///CONSULTANCY PAGE END///
                  /// CONTACT PAGE///
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: InkWell(
                            hoverColor: darkOlive.withValues(alpha: 0.69),
                            onTap: () {},
                            child: Card(
                              elevation: 9.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              color: lightOlive,
                              child: Container(
                                height: 300.0,
                                width: 666.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightOlive),
                                  borderRadius: BorderRadius.circular(3.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/pics/contact3_min.png',
                                    ),
                                    fit:
                                        BoxFit
                                            .cover, // Stretches image to fill entire 999x300px space
                                  ),
                                  color: Colors.black.withValues(
                                    alpha: 0.3,
                                  ), // Optional overlay for readability
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
                                            hoverColor: rifleGreen.withValues(
                                              alpha: 0.6,
                                            ),
                                            color: lightGreen100,
                                            icon: const Icon(
                                              Icons.contact_support_outlined,
                                              size: 39.0,
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
                                              MouseRegion(
                                                onEnter:
                                                    (_) => setState(
                                                      () =>
                                                          _isContactHovered =
                                                              true,
                                                    ),
                                                onExit:
                                                    (_) => setState(
                                                      () =>
                                                          _isContactHovered =
                                                              false,
                                                    ),
                                                child: InkWell(
                                                  hoverColor: transparentColor,
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                          3.0,
                                                        ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              transparentColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              3.0,
                                                            ),
                                                        color:
                                                            _isContactHovered
                                                                ? lightOlive // Hover color
                                                                : rifleGreen
                                                                    .withValues(
                                                                      alpha:
                                                                          0.6,
                                                                    ), // Normal color
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              3.0,
                                                            ),
                                                        child: Text(
                                                          'CONTACT\nWant to get in touch?',
                                                          style: TextStyle(
                                                            color: green100,
                                                            fontSize: 16.0,
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 2.0,
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
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
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              MouseRegion(
                                                onEnter:
                                                    (_) => setState(
                                                      () =>
                                                          _isSendMessageHovered =
                                                              true,
                                                    ),
                                                onExit:
                                                    (_) => setState(
                                                      () =>
                                                          _isSendMessageHovered =
                                                              false,
                                                    ),
                                                child: InkWell(
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                          3.0,
                                                        ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              transparentColor,
                                                        ),
                                                        color:
                                                            _isSendMessageHovered
                                                                ? midOlive
                                                                : lightGreen300
                                                                    .withValues(
                                                                      alpha:
                                                                          0.6,
                                                                    ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              3.0,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              3.0,
                                                            ),
                                                        child: Text(
                                                          'send me a message.',
                                                          style: TextStyle(
                                                            color: lime100,
                                                            fontSize: 16.0,
                                                            shadows: [
                                                              Shadow(
                                                                blurRadius: 2.0,
                                                                color:
                                                                    Colors
                                                                        .black,
                                                                offset: Offset(
                                                                  1.0,
                                                                  1.0,
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
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: MouseRegion(
                            onEnter:
                                (_) => setState(
                                  () => _isContactTextHovered = true,
                                ),
                            onExit:
                                (_) => setState(
                                  () => _isContactTextHovered = false,
                                ),
                            child: SizedBox(
                              width: 666.0,
                              child: InkWell(
                                hoverColor: transparentColor,
                                focusColor: transparentColor,
                                highlightColor: transparentColor,
                                splashColor: transparentColor,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ContactPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Feel free to reach out for any inquiries, collaborations, or just to say hello! I'm always open to connecting with like-minded individuals and exploring new opportunities.",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color:
                                        _isContactTextHovered
                                            ? lightOlive
                                            : darkOlive,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        ConnectWithMe(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // CONTACT PAGE END //
                  /// PROJECT SECTION///
                  Padding(
                    key: _projectsKey, // Assign GlobalKey
                    padding: const EdgeInsets.all(9.0),
                    child: InkWell(
                      hoverColor: lightSeaGreen.withValues(alpha: 0.69),
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 666.0,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 30.0),
                              SizedBox(
                                width: 666.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    "EXPLORE MY RECENT RESEARCH PROJECTS, INCLUDING INNOVATIVE TOOLS AND APPLICATIONS.",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: darkOlive,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    // Siikaa Project Card
                                    SizedBox(
                                      child: InkWell(
                                        hoverColor: aquaMarine,
                                        onTap: () {},
                                        child: Card(
                                          elevation: 9.0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(3.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 666.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: lightOlive,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  'assets/logo/siikaa_icon_logo.png',
                                                ),

                                                opacity: 0.3,
                                              ),
                                              color: white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                16.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipOval(
                                                        child: Image.asset(
                                                          'assets/logo/128_siikaa.png',
                                                          width: 90.0,
                                                          height: 90.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 16.0,
                                                      ),
                                                      MouseRegion(
                                                        onEnter:
                                                            (_) => setState(
                                                              () =>
                                                                  _isSiikaaHovered =
                                                                      true,
                                                            ),
                                                        onExit:
                                                            (_) => setState(
                                                              () =>
                                                                  _isSiikaaHovered =
                                                                      false,
                                                            ),
                                                        child: Text(
                                                          'Siikaa Currency Converter',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                _isSiikaaHovered
                                                                    ? lightOlive
                                                                    : darkOlive,
                                                            fontSize: 19.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 9.0),
                                                  Text(
                                                    'Siikaa is a user-friendly currency conversion app supporting over 99 currencies. It provides real-time exchange rates sourced from trusted APIs, enabling quick and accurate conversions. Features like "Fast Swap" make it ideal for travelers, freelancers, and anyone handling international payments.',
                                                    style: TextStyle(
                                                      color: darkOlive,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 9.0),
                                                  GestureDetector(
                                                    onTap:
                                                        () => _launchUrl(
                                                          'https://www.sii-kaa.com',
                                                        ),
                                                    child: Text(
                                                      'Visit Siikaa: https://www.sii-kaa.com',
                                                      style: TextStyle(
                                                        color: navy,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor: navy,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Why I Built Siikaa :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 9.0),
                                                  Text(
                                                    'As an international traveler, I frequently needed to convert currencies based on my location, often resorting to online tools. Even in regions using the US dollar, I wanted to compare prices to my home currency, XOF (West African CFA franc), for better financial decisions. Additionally, evaluating investments or stock market opportunities required quick and reliable currency conversions. I built Siikaa to simplify these tasks, providing a fast, intuitive tool for travelers, investors, and anyone needing accurate currency conversions on the go.',
                                                    style: TextStyle(
                                                      color: darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Advantages of Siikaa :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 9.0),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        color: darkOlive,
                                                      ),
                                                      children: [
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Simplicity',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Intuitive interface for effortless currency conversions.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Speed',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Real-time rates and "Fast Swap" feature for quick checks.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Good reach',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Supports over 99 currencies, perfect for international use.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Reliability',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Powered by trusted APIs for accurate and up-to-date data.',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Trusted Resources :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 9.0),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        color: darkOlive,
                                                      ),
                                                      children: [
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'Exchange Rate APIs',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Leverages reliable APIs like Open Exchange Rates for real-time data.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'Flutter Framework',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Flutter for cross-platform compatibility and smooth performance.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Firebase',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Uses Firebase for secure hosting and analytics to enhance user experience.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Currency Data',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Currency data organized by continents, accessible in-app.',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Technical Details :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 9.0),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        color: darkOlive,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Siikaa is built with a robust set of dependencies to ensure functionality, performance, and user experience:\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'cloud_firestore',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For real-time database integration.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'country_flags',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Displays country flags for currency selection.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'country_pickers',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Enhances user interface for selecting countries.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'currency_picker',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Simplifies currency selection.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'equatable',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Ensures reliable state comparison in Flutter Bloc.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'firebase_analytics',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Tracks user interactions for better insights.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'firebase_core',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Core Firebase integration for app services.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'flutter_bloc',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Manages state with a robust architecture.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'flutter_inappwebview',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Enables in-app web browsing.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'google_fonts',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Provides custom typography with Afacad fonts.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'google_mobile_ads',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Integrates ads for monetization.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'http',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Handles API requests for exchange rates.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'intl',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Formats numbers and currencies appropriately.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'shared_preferences',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Stores user preferences locally.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'syncfusion_flutter_charts',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Visualizes currency trends with charts.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'url_launcher',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Opens external links like the Siikaa website.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'webview_all & webview_flutter',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Supports web content display.\n',
                                                        ),
                                                        TextSpan(
                                                          text: '- assets:',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' Custom fonts, icons, and a JSON file for currency history.',
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
                                    ),
                                    const SizedBox(height: 30.0),
                                    MyDivider(),
                                    const SizedBox(height: 30.0),
                                    // Portfolio (Legacy) Project Card
                                    SizedBox(
                                      child: InkWell(
                                        hoverColor: darkCyan,
                                        onTap: () {},
                                        child: Card(
                                          elevation: 9.0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(3.0),
                                            ),
                                          ),
                                          color: lightOlive,
                                          child: Container(
                                            width: 666.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: lightOlive,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  'assets/logo/bled_logo512.png',
                                                ),
                                                opacity: 0.3,
                                              ),
                                              color: white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                16.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipOval(
                                                        child: Image.asset(
                                                          'assets/logo/bled_logo512.png',
                                                          width: 90.0,
                                                          height: 90.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 16.0,
                                                      ),
                                                      MouseRegion(
                                                        onEnter:
                                                            (_) => setState(
                                                              () =>
                                                                  _isLegacyHovered =
                                                                      true,
                                                            ),
                                                        onExit:
                                                            (_) => setState(
                                                              () =>
                                                                  _isLegacyHovered =
                                                                      false,
                                                            ),
                                                        child: Text(
                                                          'Portfolio (Legacy)',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                _isLegacyHovered
                                                                    ? lightOlive
                                                                    : darkOlive,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  Text(
                                                    'Portfolio (Legacy) is an early version of my personal portfolio website, showcasing my initial projects and skills as a developer. Hosted on GitHub Pages, it highlights my journey in web development with a clean and responsive design.',
                                                    style: TextStyle(
                                                      color: darkOlive,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  GestureDetector(
                                                    onTap:
                                                        () => _launchUrl(
                                                          'https://koidioble.github.io/portfolio/',
                                                        ),
                                                    child: Text(
                                                      'Visit Portfolio (Legacy): https://koidioble.github.io/portfolio/',
                                                      style: TextStyle(
                                                        color: navy,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor: navy,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Why I Built Portfolio (Legacy) :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  Text(
                                                    'As a seasoned developer, I sought a platform to showcase my projects and skills to potential clients and employers. This portfolio served as my first step in establishing an online presence, allowing me to experiment with web development technologies and design principles.',
                                                    style: TextStyle(
                                                      color: darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Advantages of Portfolio (Legacy) :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        color: darkOlive,
                                                      ),
                                                      children: [
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Simplicity',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Clean and minimalistic design for easy navigation.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'Responsiveness',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Optimized for both desktop and mobile devices.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Showcase',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Effectively highlights my early projects and skills.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Accessibility',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: stongAzure,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Hosted on GitHub Pages for reliable access.',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Trusted Resources :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        color: darkOlive,
                                                      ),
                                                      children: [
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text:
                                                              'HTML/CSS/JavaScript',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Core web technologies for building the site.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'GitHub Pages',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Free and reliable hosting platform.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Bootstrap',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: navy,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For responsive design and UI components.\n',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Technical Details :',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: darkOlive,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration
                                                              .underline,
                                                      decorationColor:
                                                          darkOlive,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        color: darkOlive,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Portfolio (Legacy) was built using standard web development technologies:\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'HTML5',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For structuring the website content.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'CSS3',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For styling and responsive design.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'JavaScript',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For interactive elements and dynamic content.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'Bootstrap',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For pre-built components and responsive grid system.\n',
                                                        ),
                                                        TextSpan(text: '- '),
                                                        TextSpan(
                                                          text: 'GitHub Pages',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: darkCyan,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': For hosting and deployment.\n',
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
                                    ),
                                    const SizedBox(height: 30.0),
                                    MyDivider(),
                                    const SizedBox(height: 30.0),
                                    // Placeholder for Future Projects
                                    AnimatedBuilder(
                                      animation: _controller,
                                      builder: (context, child) {
                                        return Opacity(
                                          opacity: _opacityAnimation.value,
                                          child: Transform.scale(
                                            scale: _scaleAnimation.value,
                                            child: Text(
                                              'Loading...!',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: darkOlive,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
