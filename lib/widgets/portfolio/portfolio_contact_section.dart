import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:koidio_ble/pages/my/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// CONTACT SECTION  —  Fresh Dark Material Layout
// ─────────────────────────────────────────────────────────────────────────────
class PortfolioContactSection extends StatelessWidget {
  final PortfolioTheme theme;

  final Key? sectionKey;
  const PortfolioContactSection({this.sectionKey, required this.theme})
    : super(key: sectionKey);

  @override
  Widget build(BuildContext context) {
    final t = PortfolioTheme.of(context);
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final pad = isMobile ? kPadM : kPad;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Text(
            "LET'S TALK",
            style: pStyle(
              size: 13.0,
              weight: FontWeight.w600,
              color: t.accent,
            ).copyWith(letterSpacing: 1.3),
          ),
        ),
        const SizedBox(height: 9.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Container(height: 1.0, width: 300.0, color: theme.accent),
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Text(
            "Get In Touch",
            style: pStyle(weight: FontWeight.w600, color: t.text, size: 19.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Text(
            "Open to full-time engineering and core technical collaboration.",
            style: pStyle(color: t.muted, height: 1.9),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad, vertical: 44.0),
          child:
              isMobile ? _ContactMobile(theme: t) : _ContactDesktop(theme: t),
        ),
      ],
    );
  }
}

// ── Layout shells ─────────────────────────────────────────────────────────────
class _ContactDesktop extends StatelessWidget {
  final PortfolioTheme theme;
  const _ContactDesktop({required this.theme});

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 5, child: _ContactInfo(theme: theme)),
      const SizedBox(width: 30.0),
    ],
  );
}

class _ContactMobile extends StatelessWidget {
  final PortfolioTheme theme;
  const _ContactMobile({required this.theme});

  @override
  Widget build(BuildContext context) => Column(
    children: [_ContactInfo(theme: theme), const SizedBox(height: 30.0)],
  );
}

// ── Contact info ──────────────────────────────────────────────────────────────
class _ContactInfo extends StatelessWidget {
  final PortfolioTheme theme;
  const _ContactInfo({required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    final List<(FaIconData, Color, String, String, String)> links = [
      (
        FontAwesomeIcons.envelope,
        t.accent,
        'Email',
        'mailto:koidioble@gmail.com',
        'email',
      ),
      (
        FontAwesomeIcons.linkedinIn,
        t.accent,
        'LinkedIn',
        'https://www.linkedin.com/in/koidioyble/',
        'url',
      ),
      (
        FontAwesomeIcons.github,
        t.accent,
        'GitHub',
        'https://github.com/koidioble',
        'url',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── "Available" status chip ──
        _AvailabilityBadge(theme: t),
        const SizedBox(height: 19.0),

        // ── Headline ──
        ShaderMask(
          shaderCallback:
              (bounds) => LinearGradient(
                colors: [t.text, t.textSub],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
          child: Text(
            'Let’s build useful software.',
            style: pStyle(weight: FontWeight.w600, height: 1.3, color: white),
          ),
        ),
        const SizedBox(height: 9.0),

        // ── Body copy ──
        Text(
          "Interested in a software engineering role, a product collaboration, "
          "or a cross-platform build? I work across responsive application "
          "experiences, APIs, authentication, cloud-backed data, and deployment. ",
          style: pStyle(color: t.muted, height: 1.9),
        ),
        const SizedBox(height: 30.0),

        // ── Social icon buttons ──
        Row(
          children: [
            for (final l in links) ...[
              _SocialIconButton(icon: l.$1, accent: l.$2, url: l.$4, theme: t),
              const SizedBox(width: 13.0),
            ],
          ],
        ),

        const SizedBox(height: 30.0),
      ],
    );
  }
}

// ── Availability badge ────────────────────────────────────────────────────────
class _AvailabilityBadge extends StatelessWidget {
  final PortfolioTheme theme;
  const _AvailabilityBadge({required this.theme});

  @override
  Widget build(BuildContext context) {
    final t = theme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: t.accent2.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(99.0),
        border: Border.all(
          color: t.accent2.withValues(alpha: 0.26),
          width: 0.9,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulseDot(color: t.accent2),
          const SizedBox(width: 9.0),
          Text(
            'Open to opportunities',
            style: pStyle(
              size: 13.0,
              weight: FontWeight.w600,
              color: t.accent2,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulseDot extends StatefulWidget {
  final Color color;
  const _PulseDot({required this.color});
  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..repeat(reverse: true);
    _anim = Tween<double>(
      begin: 0.3,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _anim,
    builder:
        (_, _) => Container(
          width: 9.0,
          height: 9.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color.withValues(alpha: _anim.value),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: _anim.value * 0.6),
                blurRadius: 6.0,
                spreadRadius: 0.9,
              ),
            ],
          ),
        ),
  );
}

// ── Icon-only social button ─────────────────────────────────────────────────
class _SocialIconButton extends StatefulWidget {
  final FaIconData icon; // was IconData
  final Color accent;
  final String url;
  final PortfolioTheme theme;

  const _SocialIconButton({
    required this.icon,
    required this.accent,
    required this.url,
    required this.theme,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _hovered = false;

  Future<void> _handleLaunch() async {
    final uri = Uri.parse(widget.url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _handleLaunch();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60.0,
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              _hovered
                  ? widget.accent.withValues(alpha: 0.19)
                  : widget.theme.surface,
          border: Border.all(
            color:
                _hovered
                    ? widget.accent.withValues(alpha: 0.6)
                    : widget.theme.border,
            width: 1,
          ),
          boxShadow:
              _hovered
                  ? [
                    BoxShadow(
                      color: widget.accent.withValues(alpha: 0.26),
                      blurRadius: 14,
                    ),
                  ]
                  : [],
        ),
        child: FaIcon(widget.icon, color: widget.accent, size: 19.0),
      ),
    ),
  );
}
