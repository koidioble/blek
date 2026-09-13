import 'package:flutter/material.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/widgets/portfolio/tech_carousel_section.dart';

class PortfolioHomeSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  final VoidCallback onAboutMe;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback? onResume;
  final VoidCallback? onGitHub;

  const PortfolioHomeSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
    required this.onAboutMe,
    required this.onSkills,
    required this.onProjects,
    this.onResume,
    this.onGitHub,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final pad = isMobile ? kPadM : kPad;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sectionColor = isDark ? const Color(0xFF1C1E14) : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(pad, isMobile ? 9.0 : 30.0, pad, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 220.0,
                height: 220.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/pics/pic2.webp'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(height: 33.0),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: onViewWork,
                    child: Container(
                      decoration: BoxDecoration(
                        //color: theme.accent2.withValues(alpha: 0.09),
                        border: Border.all(color: theme.accent2),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'Koidio Y. Blé | '
                        'Software Engineer\n'
                        'Mobile, Web & Cloud Applications',
                        style: TextStyle(
                          // backgroundColor: theme.accent,
                          //color: theme.text,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9.0),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: onViewWork,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.accent2),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'Computer and Electronics Engineering graduate. '
                        'I bring systems thinking, product ownership, and '
                        'hands-on software development experience to deliver user-focused products '
                        'from concept through deployment.',
                        style: TextStyle(
                          //backgroundColor: theme.accent2,
                          color: theme.text,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9.0),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: onViewWork,
                    child: Container(
                      decoration: BoxDecoration(
                        //color: theme.accent2.withValues(alpha: 0.09),
                        border: Border.all(color: theme.accent2),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'I build polished cross-platform products, modern web applications, '
                        'and cloud-connected systems. From user experience to deployment. '
                        'Cloud services—building responsive '
                        'interfaces, managing application state, integrating data, and delivering '
                        'production-minded software experiences.',
                        style: TextStyle(
                          backgroundColor: theme.accent2,
                          //color: theme.text,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: isMobile ? 30.0 : 9.0),

              Wrap(
                spacing: 13.0,
                runSpacing: 13.0,
                children: [
                  _HeroButton(
                    label: 'View Projects',
                    onTap: onViewWork,
                    filled: true,
                    theme: theme,
                  ),
                  if (onGitHub != null)
                    _HeroButton(
                      label: 'GitHub',
                      onTap: onGitHub!,
                      filled: false,
                      theme: theme,
                    ),
                  _HeroButton(
                    label: 'Contact',
                    onTap: onContact,
                    filled: false,
                    theme: theme,
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: isMobile ? 72 : 112),

        MyTechPortfolioSection(theme: theme, isMobile: isMobile),

        SizedBox(height: isMobile ? 72 : 112),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: pad,
            vertical: isMobile ? 28 : 40,
          ),
          decoration: BoxDecoration(color: sectionColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionLabel(text: 'ABOUT', theme: theme),
              const SizedBox(height: 16),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  'I enjoy turning complex requirements into clean, reliable '
                  'software. My work spans cross-platform mobile applications, '
                  'cloud-connected services, backend integrations, databases, '
                  'and connected-device workflows. I care about both the '
                  'engineering quality of a product and the user experience it delivers.',
                  style: pStyle(
                    size: isMobile ? 14.5 : 16,
                    color: const Color(0xFFB8BCC4),
                    height: 1.7,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 32 : 44),

              _SectionLabel(text: 'EXPLORE', theme: theme),
              const SizedBox(height: 12),

              Wrap(
                spacing: 9.0,
                runSpacing: 3.0,
                children: [
                  _QuickLink(label: 'About Me', onTap: onAboutMe, theme: theme),
                  _QuickLink(
                    label: 'Skills & Stack',
                    onTap: onSkills,
                    theme: theme,
                  ),
                  _QuickLink(
                    label: 'Projects',
                    onTap: onProjects,
                    theme: theme,
                  ),
                  _QuickLink(label: 'Contact', onTap: onContact, theme: theme),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: isMobile ? 56 : 80),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  final PortfolioTheme theme;

  const _SectionLabel({required this.text, required this.theme});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF6B8E23);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: pStyle(
            size: 13,
            weight: FontWeight.w700,
            color: accent,
          ).copyWith(letterSpacing: 1.3),
        ),
        const SizedBox(height: 9),
        Container(height: 1, width: 220, color: theme.border),
      ],
    );
  }
}

class _QuickLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final PortfolioTheme theme;

  const _QuickLink({
    required this.label,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF6B8E23);

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: accent,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        minimumSize: const Size(44, 44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: pStyle(size: 14, weight: FontWeight.w600, color: accent),
      ),
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool filled;
  final PortfolioTheme theme;

  const _HeroButton({
    required this.label,
    required this.onTap,
    required this.filled,
    required this.theme,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF6B8E23);

    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (hovered) {
        setState(() => _hovered = hovered);
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          decoration: BoxDecoration(
            color:
                widget.filled
                    ? (_hovered ? accent.withValues(alpha: 0.9) : accent)
                    : (_hovered
                        ? widget.theme.accent2.withValues(alpha: 0.6)
                        : Colors.transparent),
            borderRadius: BorderRadius.circular(9.0),
            border: Border.all(
              color: widget.filled ? Colors.transparent : widget.theme.border,
            ),
          ),
          child: Text(
            widget.label,
            style: pStyle(
              size: 13.5,
              weight: FontWeight.w600,
              color: widget.filled ? Colors.white : widget.theme.text,
            ),
          ),
        ),
      ),
    );
  }
}
