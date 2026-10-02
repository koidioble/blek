import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_section_page.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/theme/theme_provider.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_about_section.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_agent_sheet.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_contact_section.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_home_section.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_projects_section.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_skills_section.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'portfolio_navigation.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _contactKey = GlobalKey();
  late final AnimationController _glowController;

  bool _showScrollTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final show = _scrollController.offset > 240.0;
    if (show != _showScrollTop) {
      setState(() => _showScrollTop = show);
    }
  }

  void _backToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuart,
    );
  }

  void _goHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _scrollToContact() {
    final ctx = _contactKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutQuart,
      );
    }
  }

  void _openAbout() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => const PortfolioSectionPage(
              pageIcon: Icons.person_rounded,
              iconTooltip: 'Back from About Me',
              child: PortfolioAboutSection(),
            ),
      ),
    );
  }

  void _openSkills() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => const PortfolioSectionPage(
              pageIcon: Icons.code_rounded,
              iconTooltip: 'Back from Engineering Skills',
              child: PortfolioSkillsSection(),
            ),
      ),
    );
  }

  void _openProjects() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => const PortfolioSectionPage(
              pageIcon: Icons.folder_special_rounded,
              iconTooltip: 'Back from Projects',
              child: PortfolioProjectsSection(),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = PortfolioTheme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      backgroundColor: t.bg,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: t.border),
                  color: t.bg,
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: isMobile ? 64.0 : 74.0,
                            ),
                            child: AnimatedBuilder(
                              animation: _glowController,
                              builder: (context, child) {
                                const accent = Color(0xFF6B8E23);
                                final glowT = Curves.easeInOut.transform(
                                  _glowController.value,
                                );
                                final glowOpacity = 0.45 + (glowT * 0.45);
                                final content =
                                    child ?? const SizedBox.shrink();

                                return RawScrollbar(
                                  controller: _scrollController,
                                  thumbVisibility: true,
                                  trackVisibility: true,
                                  thickness: 6.0,
                                  radius: const Radius.circular(3.0),
                                  thumbColor: accent.withValues(
                                    alpha: glowOpacity,
                                  ),
                                  trackColor: t.border.withValues(alpha: 0.15),
                                  trackBorderColor: Colors.transparent,
                                  child: content,
                                );
                              },
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PortfolioHomeSection(
                                      onViewWork: _openProjects,
                                      onContact: _scrollToContact,
                                      onAboutMe: _openAbout,
                                      onSkills: _openSkills,
                                      onProjects: _openProjects,
                                      onResume: _openResume,
                                      onGitHub: _openGitHub,
                                    ),
                                    PortfolioContactSection(
                                      sectionKey: _contactKey,
                                      theme: t,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        PortfolioBottomNav(
                          onHome: _goHome,
                          isMobile: isMobile,
                          theme: t,
                        ),
                      ],
                    ),

                    // TOP APP BAR — inside the portfolio frame.
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: PortfolioTopBar(
                        theme: t,
                        isMobile: isMobile,
                        pageIcon: Icons.home_rounded,
                        iconTooltip: 'Home',
                        onPageIconTap: _goHome,
                        onOpenAgent: _openPortfolioAgent,
                      ),
                    ),

                    // Floating scroll-to-top button.
                    Positioned(
                      right: isMobile ? 16.0 : 28.0,
                      bottom: isMobile ? 76.0 : 82.0,
                      child: IgnorePointer(
                        ignoring: !_showScrollTop,
                        child: AnimatedOpacity(
                          opacity: _showScrollTop ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: AnimatedSlide(
                            duration: const Duration(milliseconds: 200),
                            offset:
                                _showScrollTop
                                    ? Offset.zero
                                    : const Offset(0, 0.3),
                            curve: Curves.easeOut,
                            child: _ScrollTopIconButton(
                              theme: t,
                              onTap: _backToTop,
                            ),
                          ),
                        ),
                      ),
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

  Future<void> _openResume() async {
    final resumeUri = Uri.parse(
      'https://www.koidioble.com/resume/Koidio_Y._Ble_Resume.pdf',
    );
    try {
      final launched = await launchUrl(
        resumeUri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );

      if (!launched && mounted) {
        _showLinkError('Unable to open the resume right now.');
      }
    } catch (error) {
      debugPrint('Resume link error: $error');

      if (mounted) {
        _showLinkError('Unable to open the resume right now.');
      }
    }
  }

  Future<void> _openGitHub() async {
    final githubUri = Uri.parse('https://github.com/koidioble');

    try {
      final launched = await launchUrl(
        githubUri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );

      if (!launched && mounted) {
        _showLinkError('Unable to open GitHub right now.');
      }
    } catch (error) {
      debugPrint('GitHub link error: $error');

      if (mounted) {
        _showLinkError('Unable to open GitHub right now.');
      }
    }
  }

  void _showLinkError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  void _openPortfolioAgent() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PortfolioAgentSheet(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// THEME TOGGLE BUTTON
// ─────────────────────────────────────────────────────────────────────────────
class _ThemeToggleBtn extends StatefulWidget {
  final PortfolioTheme theme;
  const _ThemeToggleBtn({required this.theme});

  @override
  State<_ThemeToggleBtn> createState() => _ThemeToggleBtnState();
}

class _ThemeToggleBtnState extends State<_ThemeToggleBtn> {
  bool _hov = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hov = true),
      onExit: (_) => setState(() => _hov = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<ThemeProvider>().toggleTheme(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: _hov ? widget.theme.border : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: widget.theme.border),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder:
                (child, anim) => RotationTransition(
                  turns: anim,
                  child: FadeTransition(opacity: anim, child: child),
                ),
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDark),
              size: 14,
              color: widget.theme.muted,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SCROLL-TOP ICON BUTTON
// ─────────────────────────────────────────────────────────────────────────────
class _ScrollTopIconButton extends StatefulWidget {
  final PortfolioTheme theme;
  final VoidCallback onTap;

  const _ScrollTopIconButton({required this.theme, required this.onTap});

  @override
  State<_ScrollTopIconButton> createState() => _ScrollTopIconButtonState();
}

class _ScrollTopIconButtonState extends State<_ScrollTopIconButton> {
  bool _hov = false;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF6B8E23);

    return Semantics(
      button: true,
      label: 'Scroll to top',
      child: Tooltip(
        message: 'Scroll to top',
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: widget.onTap,
            onHover: (hovered) => setState(() => _hov = hovered),
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: _hov ? accent : widget.theme.bg,
                shape: BoxShape.circle,
                border: Border.all(color: widget.theme.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.13),
                    blurRadius: 9.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_upward_rounded,
                size: 30.0,
                color: _hov ? Colors.white : widget.theme.muted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
