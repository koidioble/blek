import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PORTFOLIO NAV BAR
// ─────────────────────────────────────────────────────────────────────────────
class PortfolioNavBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTabChanged;

  const PortfolioNavBar({
    super.key,
    required this.activeIndex,
    required this.onTabChanged,
  });

  static const _tabs = ['About', 'Skills', 'Projects', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      height: isMobile ? 60.0 : 69.0,
      decoration: BoxDecoration(
        color: theme.surface,
        border: Border(bottom: BorderSide(color: theme.border)),
      ),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? kPadM : kPad),
      child: Row(
        children: [
          const Spacer(),
          if (!isMobile)
            Row(
              children: List.generate(_tabs.length, (i) {
                final active = i == activeIndex;
                return GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    onTabChanged(i);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      margin: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        _tabs[i],
                        style: pStyle(
                          size: 13.0,
                          color: active ? theme.text : theme.muted,
                          weight: active ? FontWeight.w500 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
