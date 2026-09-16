// =============================================================================
// MY TECH PORTFOLIO — domain rows x relationship-type cards
// =============================================================================
// Rows = broad tech domains (Data & Operations, Software & Systems,
// Frameworks & Dev Tools, Cloud & Infrastructure).
// Cards within each row = your relationship to that tech
// ("I'm good at it", "tried & liked it", "want to try", "shipped projects
// with it"), each holding the actual tool/tech names as chips.
//
// Cards are collapsed by default: just the label (bottom-left) + an icon
// (middle-right, swap for your own SVG/PNG). Tapping a card expands it to
// show the tech chips; tapping again collapses it.
//
// ⚠️ Swap the placeholder tech names below for your real stack — search
// "TODO" to find every spot to edit.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:koidio_ble/pages/my/my_colors.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';

// ── Data models ──────────────────────────────────────────────────────────────

class TechCardData {
  final String label; // relationship type
  final IconData icon;
  final Color cardBg;
  final Color textColor;
  final Color chipBg;
  final Color labelBg;
  final List<String> techs;

  const TechCardData({
    required this.label,
    required this.icon,
    required this.cardBg,
    required this.textColor,
    required this.chipBg,
    required this.labelBg,
    required this.techs,
  });
}

class TechDomainRow {
  final String heading; // domain name
  final String description;
  final List<TechCardData> cards;

  const TechDomainRow({
    required this.heading,
    required this.description,
    required this.cards,
  });
}

// ── Section: stacks one row per domain ───────────────────────────────────────

class MyTechPortfolioSection extends StatelessWidget {
  final PortfolioTheme theme;
  final bool isMobile;

  const MyTechPortfolioSection({
    super.key,
    required this.theme,
    required this.isMobile,
  });

  // Reused relationship-type styling across every domain so the meaning of
  // a color/icon stays consistent as you scan down the page.
  static final _crossPlatform = (
    label: "Cross-Platform Product",
    icon: Icons.devices_rounded,
    bg: forestGreen,
    text: white,
  );

  static final _web = (
    label: "Web Application Development",
    icon: Icons.language_rounded,
    bg: royalBlue,
    text: white,
  );

  static final _backend = (
    label: "Backend, Data & Integrations",
    icon: Icons.storage_rounded,
    bg: darkCyan,
    text: white,
  );

  static final _delivery = (
    label: "Cloud, Delivery & Workflow",
    icon: Icons.rocket_launch_rounded,
    bg: lightSalmon,
    text: white,
  );

  List<TechDomainRow> get _rows => [
    TechDomainRow(
      // Short "resume" of the whole portfolio — kept to one line.
      heading: "Engineering Capabilities.",
      description: "",
      cards: [
        //tech1
        TechCardData(
          label: _crossPlatform.label,
          icon: _crossPlatform.icon,
          cardBg: _crossPlatform.bg,
          textColor: _crossPlatform.text,
          chipBg: deepSkyBlue.withValues(alpha: 0.4),
          labelBg: oliveLight.withValues(alpha: 0.9),
          techs: const [
            'Flutter',
            'Dart',
            'React Native',
            'BLoC',
            'Provider',
            'Material 3',
            'Responsive UI',
            'iOS',
            'Android',
            'Web',
            'Xcode',
            'App Store Connect',
            'Play Console',
            'Kotlin',
            'Android Studio',
          ],
        ),

        //tech2
        TechCardData(
          label: _web.label,
          icon: _web.icon,
          cardBg: _web.bg,
          textColor: _crossPlatform.text,
          chipBg: roseGold.withValues(alpha: 0.44),
          labelBg: navy.withValues(alpha: 0.9),
          techs: const [
            'React',
            'Next.js',
            'TypeScript',
            'JavaScript',
            'HTML5',
            'CSS3',
            'Tailwind CSS',
            'Responsive Design',
            'Vercel',
            'Firebase Hosting',
            'Intl',
          ],
        ),

        //tech3
        TechCardData(
          label: _backend.label,
          icon: _backend.icon,
          cardBg: _backend.bg,
          textColor: _backend.text,
          chipBg: oliveDark,
          labelBg: oliveDark.withValues(alpha: 0.9),
          techs: const [
            'Supabase Auth',
            'Supabase Realtime',
            'Supabase Storage',
            'PostgreSQL',
            'Firebase Core',
            'Firebase Authentication',
            'Cloud Firestore',
            'Firebase Messaging',
            'REST APIs',
            'HTTP',
            'JSON',
            'KoboToolbox',
            'ODK',
            'XLSForm',
          ],
        ),

        //tech4
        TechCardData(
          label: _delivery.label,
          icon: _delivery.icon,
          cardBg: _delivery.bg,
          textColor: _delivery.text,
          chipBg: lightSeaGreen,
          labelBg: roseGold.withValues(alpha: 0.9),
          techs: const [
            'Git',
            'GitHub',
            'GitHub Actions',
            'Firebase Hosting',
            'Vercel',
            'Firebase Analytics',
            'AWS Fundamentals',
            'Docker Fundamentals',
            'Release Builds',
            'Debugging',
            'Testing Fundamentals',
            'Documentation',
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pad = isMobile ? kPadM : kPad;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Text(
            "ENGINEERING TOOLKIT",
            style: pStyle(
              size: 13.0,
              weight: FontWeight.w600,
              color: theme.accent,
            ).copyWith(letterSpacing: 1.3),
          ),
        ),
        const SizedBox(height: 9.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Container(height: 0.9, width: 300.0, color: theme.accent),
        ),
        const SizedBox(height: 30.0),
        for (int i = 0; i < _rows.length; i++) ...[
          _DomainRow(row: _rows[i], theme: theme, isMobile: isMobile, pad: pad),
          if (i != _rows.length - 1) ...[
            const SizedBox(height: 19.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: pad),
              child: Divider(color: theme.border, height: 1.0),
            ),
            const SizedBox(height: 19.0),
          ],
        ],
      ],
    );
  }
}

// ── Single domain row: label column + scrollable cards ───────────────────────

class _DomainRow extends StatefulWidget {
  final TechDomainRow row;
  final PortfolioTheme theme;
  final bool isMobile;
  final double pad;

  const _DomainRow({
    required this.row,
    required this.theme,
    required this.isMobile,
    required this.pad,
  });

  @override
  State<_DomainRow> createState() => _DomainRowState();
}

class _DomainRowState extends State<_DomainRow> {
  final ScrollController _controller = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateScrollState);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateScrollState();
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateScrollState);
    _controller.dispose();
    super.dispose();
  }

  void _updateScrollState() {
    if (!_controller.hasClients) return;

    final position = _controller.position;
    final canScrollLeft = position.pixels > 9.0;
    final canScrollRight = position.pixels < position.maxScrollExtent - 9.0;

    if (canScrollLeft != _canScrollLeft || canScrollRight != _canScrollRight) {
      setState(() {
        _canScrollLeft = canScrollLeft;
        _canScrollRight = canScrollRight;
      });
    }
  }

  void _scrollBy(double distance) {
    _controller.animateTo(
      (_controller.offset + distance).clamp(
        0.0,
        _controller.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = widget.isMobile ? 220.0 : 300.0;
    final cardHeight = widget.isMobile ? 220.0 : 300.0;
    final labelWidth = widget.isMobile ? 0.0 : 250.0;

    final label = Padding(
      padding: EdgeInsets.only(left: widget.pad, right: 24.0, top: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.row.heading,
            style: pStyle(
              size: 22.0,
              weight: FontWeight.w700,
              color: widget.theme.text,
            ),
          ),

          SizedBox(height: widget.isMobile ? 22.0 : 44.0),

          Text(
            widget.isMobile
                ? "Tap a card to explore my development toolkit."
                : "Click a card to explore my development toolkit.",
            style: pStyle(color: widget.theme.text, height: 1.9),
          ),
          SizedBox(height: widget.isMobile ? 22.0 : 44.0),
        ],
      ),
    );

    final cardsAndArrows = Stack(
      children: [
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: widget.isMobile ? widget.pad : 0.0,
              right: widget.pad,
            ),
            itemCount: widget.row.cards.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14.0),
            itemBuilder: (context, index) {
              return _TechCard(
                    data: widget.row.cards[index],
                    width: cardWidth,
                    height: cardHeight,
                  )
                  .animate(delay: Duration(milliseconds: 110 * index))
                  .fadeIn(duration: 450.ms, curve: Curves.easeOut)
                  .slideX(
                    begin: 0.12,
                    end: 0.0,
                    duration: 500.ms,
                    curve: Curves.easeOutCubic,
                  )
                  .scale(
                    begin: const Offset(0.96, 0.96),
                    end: const Offset(1.0, 1.0),
                    duration: 450.ms,
                    curve: Curves.easeOutCubic,
                  );
            },
          ),
        ),

        if (_canScrollLeft)
          Positioned(
            left: widget.isMobile ? widget.pad - 18.0 : 12.0,
            top: 0,
            bottom: 0,
            child: Center(
              child: _NavIconButton(
                icon: Icons.chevron_left_rounded,
                tooltip: 'Previous engineering capability',
                onTap: () => _scrollBy(-(cardWidth + 14.0)),
                theme: widget.theme,
              ),
            ),
          ),

        if (_canScrollRight)
          Positioned(
            right: widget.pad - 18.0,
            top: 0,
            bottom: 0,
            child: Center(
              child: _NavIconButton(
                icon: Icons.chevron_right_rounded,
                tooltip: 'Next engineering capability',
                onTap: () => _scrollBy(cardWidth + 14.0),
                theme: widget.theme,
              ),
            ),
          ),
      ],
    );

    if (widget.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [label, const SizedBox(height: 14.0), cardsAndArrows],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: labelWidth, child: label),
        Expanded(child: cardsAndArrows),
      ],
    );
  }
}

// ── Card: collapsed = label + icon only; tap to reveal tech chips ───────────

class _TechCard extends StatefulWidget {
  final TechCardData data;
  final double width;
  final double height;

  const _TechCard({
    required this.data,
    required this.width,
    required this.height,
  });

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  bool _expanded = false;

  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.data;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: Semantics(
        button: true,
        toggled: _expanded,
        label:
            '${d.label}. ${_expanded ? 'Hide development tools' : 'Show development tools'}.',
        child: GestureDetector(
          onTap: _toggle,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            scale: _hovered ? 1.025 : 1.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              width: widget.width,
              height: widget.height,
              transform:
                  Matrix4.identity()
                    ..translateByDouble(0.0, _hovered ? -7.0 : 0.0, 0.0, 1.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    d.cardBg.withValues(alpha: 0.98),
                    Color.lerp(d.cardBg, Colors.black, 0.28)!,
                    Color.lerp(d.cardBg, Colors.black, 0.48)!,
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: d.textColor.withValues(alpha: _hovered ? 0.38 : 0.12),
                  width: _hovered ? 1.4 : 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: d.cardBg.withValues(alpha: _hovered ? 0.42 : 0.16),
                    blurRadius: _hovered ? 28.0 : 12.0,
                    spreadRadius: _hovered ? 2.0 : 0.0,
                    offset: Offset(0.0, _hovered ? 12.0 : 5.0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -74.0,
                    right: -74.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _hovered ? 185.0 : 145.0,
                      height: _hovered ? 185.0 : 145.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: d.textColor.withValues(
                          alpha: _hovered ? 0.15 : 0.08,
                        ),
                      ),
                    ),
                  ),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    reverseDuration: const Duration(milliseconds: 180),
                    transitionBuilder: (child, animation) {
                      final slide = Tween<Offset>(
                        begin: const Offset(0.08, 0.0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCubic,
                        ),
                      );

                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(position: slide, child: child),
                      );
                    },
                    child:
                        _expanded
                            ? _ExpandedContent(
                              key: const ValueKey('expanded'),
                              data: d,
                            )
                            : _AnimatedCollapsedContent(
                              key: const ValueKey('collapsed'),
                              data: d,
                              hovered: _hovered,
                              pulse: _pulseController,
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Collapsed: title bottom-left, icon middle-right. No pills.
class _AnimatedCollapsedContent extends StatelessWidget {
  final TechCardData data;
  final bool hovered;
  final Animation<double> pulse;

  const _AnimatedCollapsedContent({
    super.key,
    required this.data,
    required this.hovered,
    required this.pulse,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: pulse,
            builder: (context, child) {
              final scale = 1.0 + (pulse.value * 0.08);

              return Transform.scale(
                scale: hovered ? scale : 1.0,
                child: child,
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: hovered ? 96.0 : 82.0,
              height: hovered ? 96.0 : 82.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: data.textColor.withValues(alpha: hovered ? 0.18 : 0.10),
                border: Border.all(
                  color: data.textColor.withValues(
                    alpha: hovered ? 0.38 : 0.16,
                  ),
                ),
              ),
              child: Icon(
                data.icon,
                size: hovered ? 43.0 : 38.0,
                color: data.textColor,
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 180),
            opacity: hovered ? 1.0 : 0.72,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.touch_app_rounded,
                  size: 15.0,
                  color: data.textColor,
                ),
                const SizedBox(width: 6.0),
                Text(
                  'EXPLORE TOOLS',
                  style: pStyle(
                    size: 10.0,
                    weight: FontWeight.w700,
                    color: data.textColor,
                  ).copyWith(letterSpacing: 0.9),
                ),
              ],
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: data.labelBg,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    data.label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: pStyle(
                      size: 13.0,
                      weight: FontWeight.w600,
                      color: data.textColor,
                    ).copyWith(height: 1.25),
                  ),
                ),
                const SizedBox(width: 5.0),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
                  offset: hovered ? const Offset(0.18, 0.0) : Offset.zero,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 16.0,
                    color: data.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Expanded: small header + wrapped tech chips.
class _ExpandedContent extends StatelessWidget {
  final TechCardData data;

  const _ExpandedContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'TECHNOLOGIES',
                style: pStyle(
                  size: 12.0,
                  weight: FontWeight.w700,
                  color: data.textColor,
                ).copyWith(letterSpacing: 1.0),
              ),
            ),
            Icon(
              Icons.close_rounded,
              size: 18.0,
              color: data.textColor.withValues(alpha: 0.85),
            ),
          ],
        ),

        const SizedBox(height: 10.0),

        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 7.0,
              runSpacing: 7.0,
              children: [
                for (final tech in data.techs)
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 0.92 + (value * 0.08),
                        child: Opacity(opacity: value, child: child),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: data.chipBg,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: data.textColor.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Text(
                        tech,
                        style: pStyle(
                          size: 10.0,
                          weight: FontWeight.w600,
                          color: data.textColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10.0),

        Text(
          'Click again to close',
          style: pStyle(
            size: 10.0,
            weight: FontWeight.w500,
            color: data.textColor.withValues(alpha: 0.78),
          ),
        ),
      ],
    );
  }
}

// ── Nav arrow: black + white icon by default, olive + white icon on hover ───

class _NavIconButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final PortfolioTheme theme;

  const _NavIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    required this.theme,
  });

  @override
  State<_NavIconButton> createState() => _NavIconButtonState();
}

class _NavIconButtonState extends State<_NavIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.tooltip,
      child: Tooltip(
        message: widget.tooltip,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: _hovered ? widget.theme.accent : Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 8.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(widget.icon, size: 20.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
