import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SHARED SMALL WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

// ── Pulsing dot ───────────────────────────────────────────────────────────────
class PulsingDot extends StatefulWidget {
  final Color color;
  final double size;
  const PulsingDot({super.key, required this.color, this.size = 8});

  @override
  State<PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    _anim = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _anim,
    child: Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
    ),
  );
}

// ── Chip / tag pill ──────────────────────────────────────────────────────────
class PTag extends StatelessWidget {
  final String label;
  final PortfolioTheme theme;
  const PTag(this.label, {super.key, required this.theme});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
    decoration: BoxDecoration(
      color: theme.text.withValues(alpha: 0.04),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: theme.border),
    ),
    child: Text(label, style: pStyle(size: 11, color: theme.muted)),
  );
}

// ── Coloured badge ────────────────────────────────────────────────────────────
class PBadge extends StatelessWidget {
  final String label;
  final Color accent;
  const PBadge(this.label, {super.key, required this.accent});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
    decoration: BoxDecoration(
      color: accent.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: accent.withValues(alpha: 0.25)),
    ),
    child: Text(label, style: pStyle(size: 11, color: accent)),
  );
}

// ── Section header ────────────────────────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.of(context);
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final pad = isMobile ? kPadM : kPad;

    return Container(
      padding:
          padding ?? EdgeInsets.fromLTRB(pad, 48, pad, 32), // now responsive
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: pStyle(
              size: 11,
              color: theme.accent,
              weight: FontWeight.w500,
              letterSpacing: 3.0,
            ),
          ),
          const SizedBox(height: 9.0),
          Text(
            title,
            style: pStyle(
              size: 33.0,
              weight: FontWeight.w600,
              height: 1.3,
              color: theme.text,
            ),
          ),
          const SizedBox(height: 9.0),
          Text(subtitle, style: pStyle(size: 16.0, color: theme.muted)),
        ],
      ),
    );
  }
}

// ── Hover-lift card wrapper ───────────────────────────────────────────────────
class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double radius;
  final PortfolioTheme theme;
  const HoverCard({
    super.key,
    required this.child,
    required this.theme,
    this.onTap,
    this.radius = 14,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
        decoration: cardDecoration(
          borderColor:
              _hovered
                  ? widget.theme.accent.withValues(alpha: 0.4)
                  : widget.theme.border,
          bgColor:
              _hovered
                  ? widget.theme.accent.withValues(alpha: 0.04)
                  : widget.theme.surface,
          radius: widget.radius,
        ),
        child: widget.child,
      ),
    ),
  );
}
