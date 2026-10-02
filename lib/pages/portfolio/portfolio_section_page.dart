import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_navigation.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_agent_sheet.dart';

class PortfolioSectionPage extends StatelessWidget {
  final Widget child;
  final IconData pageIcon;
  final String iconTooltip;

  const PortfolioSectionPage({
    super.key,
    required this.child,
    required this.pageIcon,
    required this.iconTooltip,
  });

  void _goHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _openPortfolioAgent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PortfolioAgentSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      backgroundColor: theme.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              color: theme.bg,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: theme.border),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: isMobile ? 64.0 : 74.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: child,
                        ),
                      ),
                    ),

                    PortfolioBottomNav(
                      onHome: () => _goHome(context),
                      isMobile: isMobile,
                      theme: theme,
                    ),
                  ],
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: PortfolioTopBar(
                    theme: theme,
                    isMobile: isMobile,
                    pageIcon: pageIcon,
                    iconTooltip: iconTooltip,
                    onPageIconTap: () => Navigator.of(context).pop(),
                    onOpenAgent: () => _openPortfolioAgent(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
