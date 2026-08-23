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
import 'package:koidio_ble/pages/my/my_colors.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:lottie/lottie.dart';

// ── Data models ──────────────────────────────────────────────────────────────

class TechCardData {
  final String label; // relationship type, e.g. "I'm good at this"
  final IconData icon;
  final String? lottieAsset; // optional — if set, used instead of icon
  final Color cardBg;
  final Color textColor;
  final Color chipBg;
  final List<String> techs;

  const TechCardData({
    required this.label,
    required this.icon,
    this.lottieAsset,
    required this.cardBg,
    required this.textColor,
    required this.chipBg,
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
    label: "Cross-Platform Product Engineering",
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

  static final List<TechDomainRow> _rows = [
    TechDomainRow(
      // Short "resume" of the whole portfolio — kept to one line.
      heading: "Engineering Capabilities",
      description:
          "Technologies I use to design, build, ship, and maintain software products.",
      cards: [
        //tech1
        TechCardData(
          label: _crossPlatform.label,
          icon: _crossPlatform.icon,
          cardBg: _crossPlatform.bg,
          textColor: _crossPlatform.text,
          chipBg: deepSkyBlue.withValues(alpha: 0.5),
          techs: const [
            'Flutter',
            'Dart',
            'BLoC',
            'Provider',
            'Material 3',
            'Responsive UI',
            'iOS',
            'Android',
            'Web',
            'App Store Connect',
            'Play Console',
          ],
        ),

        //tech2
        TechCardData(
          label: _web.label,
          icon: _web.icon,
          cardBg: _web.bg,
          textColor: _crossPlatform.text,
          chipBg: roseGold.withValues(alpha: 0.6),
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
          ],
        ),

        //tech3
        TechCardData(
          label: _backend.label,
          icon: _backend.icon,
          cardBg: _backend.bg,
          textColor: _backend.text,
          chipBg: oliveDark,
          techs: const [
            'Supabase Auth',
            'Supabase Realtime',
            'Supabase Storage',
            'PostgreSQL',
            'Firebase Authentication',
            'Cloud Firestore',
            'Firebase Cloud Messaging',
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
          lottieAsset: 'assets/json/tech4.json',
          chipBg: lightSeaGreen,
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
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateScrollState);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateScrollState);
    _controller.dispose();
    super.dispose();
  }

  void _updateScrollState() {
    if (!_controller.hasClients) return;
    final max = _controller.position.maxScrollExtent;
    setState(() => _canScrollRight = _controller.offset < max - 10);
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
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "${widget.row.heading}\n",
              style: pStyle(
                size: 18.0,
                weight: FontWeight.w700,
                color: widget.theme.text,
              ),
            ),
            TextSpan(
              text: widget.row.description,
              style: pStyle(
                size: 13.0,
                weight: FontWeight.w400,
                color: widget.theme.muted,
              ).copyWith(height: 1.4),
            ),
          ],
        ),
      ),
    );

    final cardsAndArrow = Stack(
      alignment: Alignment.centerRight,
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
              );
            },
          ),
        ),
        if (_canScrollRight)
          Padding(
            padding: EdgeInsets.only(right: widget.pad - 18.0),
            child: _NavIconButton(
              enabled: _canScrollRight,
              onTap: () => _scrollBy(cardWidth + 14),
              theme: widget.theme,
            ),
          ),
      ],
    );

    if (widget.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [label, const SizedBox(height: 14.0), cardsAndArrow],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: labelWidth, child: label),
        Expanded(child: cardsAndArrow),
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

class _TechCardState extends State<_TechCard> {
  bool _hovered = false;
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    final d = widget.data;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _toggle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: widget.width,
          height: widget.height,
          transform:
              _hovered
                  ? (Matrix4.identity()..translateByDouble(0.0, -6.0, 0.0, 1.0))
                  : Matrix4.identity(),
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: d.cardBg,
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                color:
                    _hovered
                        ? d.textColor.withValues(alpha: 0.20)
                        : Colors.black.withValues(alpha: 0.05),
                blurRadius: _hovered ? 18.0 : 8.0,
                offset: Offset(0, _hovered ? 8 : 3),
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child:
                _expanded
                    ? _ExpandedContent(key: const ValueKey('expanded'), data: d)
                    : _CollapsedContent(
                      key: const ValueKey('collapsed'),
                      data: d,
                    ),
          ),
        ),
      ),
    );
  }
}

// Collapsed: title bottom-left, icon middle-right. No pills.
class _CollapsedContent extends StatelessWidget {
  final TechCardData data;

  const _CollapsedContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child:
              data.lottieAsset != null
                  ? Lottie.asset(
                    data.lottieAsset!,

                    repeat: true,
                    fit: BoxFit.contain,
                  )
                  : Icon(
                    data.icon,
                    size: 48.0,
                    color: data.textColor.withValues(alpha: 0.9),
                  ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            data.label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: pStyle(
              size: 13.0,
              // weight: FontWeight.w600,
              color: data.textColor,
              height: 1.2,
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
        Text(
          'Technologies',
          style: pStyle(
            size: 13.0,
            weight: FontWeight.w600,
            color: data.textColor,
          ).copyWith(letterSpacing: 0.9),
        ),
        const SizedBox(height: 9.0),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: [
                for (final tech in data.techs)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 3.0,
                    ),
                    decoration: BoxDecoration(
                      color: data.chipBg,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      tech,
                      style: pStyle(
                        size: 9.0,
                        weight: FontWeight.w600,
                        color: data.textColor,
                      ),
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

// ── Nav arrow: black + white icon by default, olive + white icon on hover ───

class _NavIconButton extends StatefulWidget {
  final bool enabled;
  final VoidCallback onTap;
  final PortfolioTheme theme;

  const _NavIconButton({
    required this.enabled,
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
    final active = widget.enabled;
    final showAccent = _hovered && active;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: active ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: active ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: showAccent ? widget.theme.accent : Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 8.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(
            Icons.chevron_right_rounded,
            size: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
