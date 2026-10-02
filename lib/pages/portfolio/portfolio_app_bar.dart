import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class PortfolioAppBar extends StatelessWidget {
  final PortfolioTheme theme;
  final String title;
  final bool showBackButton;
  final VoidCallback onHome;
  final VoidCallback onOpenAgent;

  const PortfolioAppBar({
    super.key,
    required this.theme,
    required this.title,
    required this.showBackButton,
    required this.onHome,
    required this.onOpenAgent,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return SafeArea(
      bottom: false,
      child: Container(
        height: isMobile ? 58.0 : 66.0,
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 10.0 : 18.0),
        decoration: BoxDecoration(
          color: theme.bg.withValues(alpha: 0.97),
          border: Border(bottom: BorderSide(color: theme.border)),
        ),
        child: Row(
          children: [
            Tooltip(
              message: showBackButton ? 'Back' : 'Home',
              child: IconButton(
                onPressed:
                    showBackButton ? () => Navigator.of(context).pop() : onHome,
                icon: Icon(
                  showBackButton
                      ? Icons.arrow_back_rounded
                      : Icons.home_rounded,
                ),
                color: theme.muted,
              ),
            ),

            const SizedBox(width: 8.0),

            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 14.0 : 16.0,
                  fontWeight: FontWeight.w600,
                  color: theme.text,
                ),
              ),
            ),

            Tooltip(
              message: 'Ask Koidio’s portfolio guide',
              child: IconButton(
                onPressed: onOpenAgent,
                icon: const Icon(Icons.auto_awesome_rounded),
                color: const Color(0xFF6B8E23),
              ),
            ),

            const SizedBox(width: 4.0),

            _AppBarThemeToggle(theme: theme),
          ],
        ),
      ),
    );
  }
}

class _AppBarThemeToggle extends StatefulWidget {
  final PortfolioTheme theme;

  const _AppBarThemeToggle({required this.theme});

  @override
  State<_AppBarThemeToggle> createState() => _AppBarThemeToggleState();
}

class _AppBarThemeToggleState extends State<_AppBarThemeToggle> {
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
        onTap: () {
          context.read<ThemeProvider>().toggleTheme();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovered ? widget.theme.border : Colors.transparent,
            border: Border.all(color: widget.theme.border),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDark),
              size: 16.0,
              color: widget.theme.muted,
            ),
          ),
        ),
      ),
    );
  }
}
