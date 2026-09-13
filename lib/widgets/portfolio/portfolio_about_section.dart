import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ABOUT SECTION
// ─────────────────────────────────────────────────────────────────────────────
class PortfolioAboutSection extends StatelessWidget {
  final Key? sectionKey;
  const PortfolioAboutSection({this.sectionKey}) : super(key: sectionKey);

  @override
  Widget build(BuildContext context) {
    final t = PortfolioTheme.of(context);
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final pad = isMobile ? kPadM : kPad;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'Background',
          title: 'About Me',
          subtitle: 'Engineer, builder, creator',
        ),
        Padding(
          padding: EdgeInsets.all(pad),
          child: isMobile ? _MobileLayout(theme: t) : _DesktopLayout(theme: t),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DESKTOP — two columns
// ─────────────────────────────────────────────────────────────────────────────
class _DesktopLayout extends StatelessWidget {
  final PortfolioTheme theme;
  const _DesktopLayout({required this.theme});

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 3, child: _WhoIAm(theme: theme)),
      const SizedBox(width: 39.0),
      Expanded(flex: 3, child: _RightColumn(theme: theme)),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// MOBILE — single column
// ─────────────────────────────────────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  final PortfolioTheme theme;
  const _MobileLayout({required this.theme});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _WhoIAm(theme: theme),
      const SizedBox(height: 40),
      _RightColumn(theme: theme),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// WHO I AM
// ─────────────────────────────────────────────────────────────────────────────
class _WhoIAm extends StatelessWidget {
  final PortfolioTheme theme;
  const _WhoIAm({required this.theme});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who I am',
          style: pStyle(size: 19.0, weight: FontWeight.w600, color: theme.text),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Computer Engineering Technology graduate and software engineer with '
          'hands-on experience building cross-platform mobile, web, and cloud-connected '
          'applications. I use Flutter and Dart, React, JavaScript, TypeScript, Firebase, Supabase, REST APIs, '
          'databases, and modern web technologies to turn product requirements into '
          'clean, maintainable software.',
          style: pStyle(size: isMobile ? 13.0 : 16.00, color: theme.muted),
        ),
        const SizedBox(height: 16.0),
        Text(
          'I enjoy working through complex problems with a practical, user-focused '
          'approach: separating UI, state, and service logic; handling loading and '
          'error states; integrating authentication and data workflows; and preparing '
          'applications for deployment. I value clear communication, feedback, and '
          'continuous improvement in collaborative teams.',
          style: pStyle(size: isMobile ? 13.0 : 16.00, color: theme.muted),
        ),

        const SizedBox(height: 44.0),

        // ── Focus areas ──
        Text(
          'Focus areas',
          style: pStyle(size: 13.0, color: theme.muted, letterSpacing: 1.2),
        ),
        const SizedBox(height: 16.0),
        _FocusGrid(theme: theme),
      ],
    );
  }
}

class _FocusGrid extends StatelessWidget {
  final PortfolioTheme theme;
  const _FocusGrid({required this.theme});

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        Icons.smartphone_rounded,
        theme.accent,
        'Mobile application development',
      ),
      (Icons.code_rounded, theme.accent2, 'Object-oriented programming'),
      (Icons.storage_rounded, theme.accent3, 'Database-backed workflows'),
      (Icons.cloud_done_rounded, theme.accent, 'Cloud and deployment'),
      (Icons.bug_report_rounded, theme.accent2, 'Debugging and quality'),
      (
        Icons.groups_rounded,
        theme.text.withValues(alpha: 0.6),
        'Collaboration and communication',
      ),
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 3.2,
      children: items.map((i) => _FocusTile(i.$1, i.$2, i.$3, theme)).toList(),
    );
  }
}

class _FocusTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final PortfolioTheme theme;

  const _FocusTile(this.icon, this.color, this.label, this.theme);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 9.0),
      decoration: cardDecoration(
        borderColor: theme.border,
        bgColor: theme.surface,
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 19.0),
          const SizedBox(width: 9.0),
          Expanded(
            child: Text(
              label,
              style: pStyle(size: 13.0, color: theme.text),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// RIGHT COLUMN — Interests + Approach principles
// ─────────────────────────────────────────────────────────────────────────────
class _RightColumn extends StatelessWidget {
  final PortfolioTheme theme;
  const _RightColumn({required this.theme});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [const SizedBox(height: 40), _Approach(theme: theme)],
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// APPROACH
// ─────────────────────────────────────────────────────────────────────────────
class _Approach extends StatelessWidget {
  final PortfolioTheme theme;
  const _Approach({required this.theme});

  @override
  Widget build(BuildContext context) {
    final principles = [
      (
        Icons.autorenew_rounded,
        'Continuous growth',
        'Every project leaves me sharper than the last.',
      ),
      (
        Icons.shield_outlined,
        'Resilience by default',
        'Built to fail gracefully, recover fast.',
      ),
      (
        Icons.rocket_launch_rounded,
        'Ship with intent',
        'From design to deployment — I own the full arc.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How I work',
          style: pStyle(size: 20, weight: FontWeight.w500, color: theme.text),
        ),
        const SizedBox(height: 16),
        ...principles.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.accent.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(p.$1, color: theme.accent, size: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.$2,
                        style: pStyle(
                          size: 14,
                          weight: FontWeight.w500,
                          color: theme.text,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        p.$3,
                        style: pStyle(
                          size: 12,
                          color: theme.muted,
                          height: 1.5,
                        ),
                      ),
                    ],
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
