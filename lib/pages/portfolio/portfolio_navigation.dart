import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class PortfolioTopBar extends StatelessWidget {
  final PortfolioTheme theme;
  final bool isMobile;
  final IconData pageIcon;
  final String iconTooltip;
  final VoidCallback onPageIconTap;
  final VoidCallback onOpenAgent;

  const PortfolioTopBar({
    super.key,
    required this.theme,
    required this.isMobile,
    required this.pageIcon,
    required this.iconTooltip,
    required this.onPageIconTap,
    required this.onOpenAgent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 60.0 : 66.0,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : kPad),
      decoration: BoxDecoration(
        color: theme.bg.withValues(alpha: 0.96),
        border: Border(bottom: BorderSide(color: theme.border)),
      ),
      child: Row(
        children: [
          Tooltip(
            message: iconTooltip,
            child: IconButton(
              onPressed: onPageIconTap,
              icon: Icon(pageIcon),
              color: theme.accent,
            ),
          ),

          const Spacer(),

          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onOpenAgent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: theme.border),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.robot,
                      size: 13.0,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      isMobile ? 'Ask Koidio' : 'Ask Koidio’s portfolio guide',
                      style: TextStyle(fontSize: 11.0, color: theme.text),
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
}

class PortfolioBottomNav extends StatelessWidget {
  final VoidCallback onHome;
  final bool isMobile;
  final PortfolioTheme theme;

  const PortfolioBottomNav({
    super.key,
    required this.onHome,
    required this.isMobile,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().themeMode == ThemeMode.dark;

    return Container(
      height: isMobile ? 60.0 : 66.0,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : kPad),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.border)),
      ),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onHome,
              child: Image.asset(
                isDark
                    ? 'assets/logo/KYB_icon_dark.png'
                    : 'assets/logo/KYB_icon_light.png',
                width: isMobile ? 22.0 : 44.0,
                height: isMobile ? 22.0 : 44.0,
              ),
            ),
          ),

          const Spacer(),

          _PortfolioThemeToggle(theme: theme),
          const SizedBox(width: 13.0),

          _PortfolioNavButton(
            label: 'Home',
            icon: FontAwesomeIcons.house,
            onTap: onHome,
            theme: theme,
          ),
        ],
      ),
    );
  }
}

class _PortfolioThemeToggle extends StatefulWidget {
  final PortfolioTheme theme;

  const _PortfolioThemeToggle({required this.theme});

  @override
  State<_PortfolioThemeToggle> createState() => _PortfolioThemeToggleState();
}

class _PortfolioThemeToggleState extends State<_PortfolioThemeToggle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.read<ThemeProvider>().toggleTheme(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            color: _hovered ? widget.theme.border : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: widget.theme.border),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDark),
              size: 14.0,
              color: widget.theme.muted,
            ),
          ),
        ),
      ),
    );
  }
}

class _PortfolioNavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final PortfolioTheme theme;
  final FaIconData? icon;

  const _PortfolioNavButton({
    required this.label,
    required this.onTap,
    required this.theme,
    this.icon,
  });

  @override
  State<_PortfolioNavButton> createState() => _PortfolioNavButtonState();
}

class _PortfolioNavButtonState extends State<_PortfolioNavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: _hovered ? widget.theme.border : Colors.transparent,
            borderRadius: BorderRadius.circular(9.0),
            border: Border.all(color: widget.theme.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                FaIcon(
                  widget.icon,
                  size: 13.0,
                  color: _hovered ? widget.theme.text : widget.theme.muted,
                ),
                const SizedBox(width: 6.0),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 11.0,
                  color: _hovered ? widget.theme.text : widget.theme.muted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
