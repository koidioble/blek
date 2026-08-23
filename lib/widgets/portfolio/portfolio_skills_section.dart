import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_data.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SKILLS SECTION
// ─────────────────────────────────────────────────────────────────────────────
class PortfolioSkillsSection extends StatelessWidget {
  final Key? sectionKey;
  const PortfolioSkillsSection({this.sectionKey}) : super(key: sectionKey);

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.of(context);
    return Column(
      children: [
        const SectionHeader(
          label: 'Capabilities',
          title: 'Engineering Skills',
          subtitle:
              'Tools and practices used to build cross-platform, web, cloud, and data-driven products',
        ),
        _SkillsGrid(theme: theme),
      ],
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  final PortfolioTheme theme;
  const _SkillsGrid({required this.theme});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final isTablet = w >= 700 && w < 1100;
    final pad = isMobile ? kPadM : kPad;

    return Padding(
      padding: EdgeInsets.all(pad),
      child:
          isMobile
              ? Column(
                children: List.generate(
                  portfolioSkills.length,
                  (i) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _SkillCard(data: portfolioSkills[i], theme: theme),
                  ),
                ),
              )
              : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 2 : 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  mainAxisExtent: 440.0,
                ),
                itemCount: portfolioSkills.length,
                itemBuilder:
                    (_, i) =>
                        _SkillCard(data: portfolioSkills[i], theme: theme),
              ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillData data;
  final PortfolioTheme theme;
  const _SkillCard({required this.data, required this.theme});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = skillAccent(widget.data.color, widget.theme);
    final bg = accent.withValues(alpha: 0.08);

    return GestureDetector(
      onTapDown: (_) => setState(() => _hovered = true),
      onTapUp: (_) => setState(() => _hovered = false),
      onTapCancel: () => setState(() => _hovered = false),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
          padding: const EdgeInsets.all(20),
          decoration: cardDecoration(
            borderColor:
                _hovered ? accent.withValues(alpha: 0.5) : widget.theme.border,
            bgColor:
                _hovered
                    ? accent.withValues(alpha: 0.04)
                    : widget.theme.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(widget.data.icon, color: accent, size: 22),
                  ),
                  PBadge(widget.data.tier, accent: accent),
                ],
              ),
              const SizedBox(height: 13.0),
              Text(
                widget.data.title,
                style: pStyle(
                  size: 14,
                  weight: FontWeight.w500,
                  color: widget.theme.text,
                ),
              ),
              const SizedBox(height: 3.0),
              Text(
                widget.data.subtitle,
                style: pStyle(size: 11, color: widget.theme.muted),
              ),
              const SizedBox(height: 13.0),
              Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children:
                    widget.data.tags
                        .map((t) => PTag(t, theme: widget.theme))
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
