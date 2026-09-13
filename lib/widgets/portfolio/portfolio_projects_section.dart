import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_data.dart';
import 'package:koidio_ble/pages/portfolio/portfolio_theme.dart';
import 'package:koidio_ble/widgets/portfolio/portfolio_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PROJECTS SECTION
// ─────────────────────────────────────────────────────────────────────────────
class PortfolioProjectsSection extends StatelessWidget {
  final Key? sectionKey;
  const PortfolioProjectsSection({this.sectionKey}) : super(key: sectionKey);

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.of(context);
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final pad = isMobile ? kPadM : kPad;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'Work',
          title: 'Selected Projects',
          subtitle: 'Cross-platform apps, data systems, and full-stack builds',
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(pad, 33.0, pad, pad),
          child:
              isMobile
                  ? Column(
                    children:
                        portfolioProjects
                            .map(
                              (p) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: _ProjectCard(data: p, theme: theme),
                              ),
                            )
                            .toList(),
                  )
                  : _DesktopGrid(theme: theme, pad: pad),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DESKTOP GRID
// ─────────────────────────────────────────────────────────────────────────────
class _DesktopGrid extends StatelessWidget {
  final PortfolioTheme theme;
  final double pad;
  const _DesktopGrid({required this.theme, required this.pad});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final crossCount = w >= 1100 ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 30.0,
        mainAxisExtent: 560.0,
      ),
      itemCount: portfolioProjects.length,
      itemBuilder:
          (_, i) => _ProjectCard(data: portfolioProjects[i], theme: theme),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PROJECT CARD
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectCard extends StatefulWidget {
  final ProjectData data;
  final PortfolioTheme theme;
  const _ProjectCard({required this.data, required this.theme});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with TickerProviderStateMixin {
  bool _hovered = false;

  late final AnimationController _glowController;
  late final Animation<double> _glowAnim;
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
    _glowAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _setHover(bool v) {
    setState(() => _hovered = v);
    if (v) {
      _scaleController.forward();
    } else {
      _scaleController.reverse();
    }
  }

  void _openDetail() {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (_) => _ProjectDetailSheet(data: widget.data, theme: widget.theme),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accent = projectAccent(widget.data.color, widget.theme);

    return GestureDetector(
      onTapDown: (_) => _setHover(true),
      onTapUp: (_) {
        _setHover(false);
        _openDetail();
      },
      onTapCancel: () => _setHover(false),
      child: MouseRegion(
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        cursor: SystemMouseCursors.click,
        child: AnimatedBuilder(
          animation: Listenable.merge([_glowAnim, _scaleAnim]),
          builder: (context, child) {
            final glowOpacity =
                _hovered
                    ? 0.55 + _glowAnim.value * 0.25
                    : 0.15 + _glowAnim.value * 0.12;
            final glowBlur = _hovered ? 20.0 + _glowAnim.value * 12 : 0.0;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              transform:
                  _hovered
                      ? (Matrix4.identity()
                        ..translateByDouble(0.0, -6.0, 0.0, 1.0))
                      : Matrix4.identity(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.0),
                border: Border.all(
                  color: accent.withValues(alpha: _hovered ? 0.6 : 0.22),
                  width: _hovered ? 1.5 : 1.0,
                ),
                color: widget.theme.surface,
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: glowOpacity * 0.35),
                    blurRadius: glowBlur,
                    spreadRadius: _hovered ? 2 : 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: child,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _ProjectBanner(
                data: widget.data,
                accent: accent,
                theme: widget.theme,
                scaleAnim: _scaleAnim,
                glowAnim: _glowAnim,
                hovered: _hovered,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children:
                          widget.data.badges
                              .map((b) => PBadge(b, accent: accent))
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.data.name,
                      style: pStyle(
                        size: 17,
                        weight: FontWeight.w500,
                        color: widget.theme.text,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.data.description,
                      style: pStyle(
                        size: 13,
                        color: widget.theme.muted,
                        height: 1.6,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Divider(color: widget.theme.border, height: 28),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              const maxTagsOnCard = 8;
                              final stack = widget.data.stack;
                              final visible =
                                  stack.take(maxTagsOnCard).toList();
                              final remaining = stack.length - visible.length;

                              return Wrap(
                                spacing: 6.0,
                                runSpacing: 6.0,
                                children: [
                                  ...visible.map(
                                    (t) => PTag(t, theme: widget.theme),
                                  ),
                                  if (remaining > 0)
                                    PTag('+$remaining', theme: widget.theme),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13.0),
                        AnimatedSlide(
                          offset: Offset(_hovered ? 0.1 : 0, 0),
                          duration: const Duration(milliseconds: 220),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                MediaQuery.of(context).size.width < 420.0
                                    ? 'Details'
                                    : 'View case study',
                                style: pStyle(
                                  size: 13.0,
                                  weight: FontWeight.w600,
                                  color: accent,
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 16.0,
                                color: accent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PROJECT BANNER
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectBanner extends StatelessWidget {
  final ProjectData data;
  final Color accent;
  final PortfolioTheme theme;
  final Animation<double> scaleAnim;
  final Animation<double> glowAnim;
  final bool hovered;

  const _ProjectBanner({
    required this.data,
    required this.accent,
    required this.theme,
    required this.scaleAnim,
    required this.glowAnim,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = data.logoAsset;
    final hasImage = imagePath != null && imagePath.isNotEmpty;

    return SizedBox(
      height: 160.0,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRect(
            child: AnimatedBuilder(
              animation: scaleAnim,
              builder:
                  (context, child) =>
                      Transform.scale(scale: scaleAnim.value, child: child),
              child:
                  hasImage
                      ? Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, _, _) => _FallbackBanner(
                              accent: accent,
                              icon: data.icon,
                              hovered: hovered,
                            ),
                      )
                      : _FallbackBanner(
                        accent: accent,
                        icon: data.icon,
                        hovered: hovered,
                      ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.10),
                  Colors.black.withValues(alpha: 0.52),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: glowAnim,
            builder:
                (_, _) => IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: hovered ? 0.18 + glowAnim.value * 0.10 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            accent.withValues(alpha: 0.0),
                            accent.withValues(alpha: 0.7),
                            accent.withValues(alpha: 0.0),
                          ],
                          stops: [0.0, 0.4 + glowAnim.value * 0.2, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
          ),
          if (data.status != null)
            Positioned(
              top: 12.0,
              right: 12.0,
              child: _StatusBadge(
                status: data.status!,
                accent: accent,
                onImage: true,
              ),
            ),
          Positioned(
            bottom: 12.0,
            left: 14.0,
            child: _LogoPill(data: data, accent: accent, theme: theme),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FALLBACK BANNER
// ─────────────────────────────────────────────────────────────────────────────
class _FallbackBanner extends StatelessWidget {
  final Color accent;
  final IconData icon;
  final bool hovered;
  const _FallbackBanner({
    required this.accent,
    required this.icon,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: accent.withValues(alpha: hovered ? 0.15 : 0.08),
      child: Center(
        child: Icon(icon, size: 52, color: accent.withValues(alpha: 0.65)),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LOGO PILL
// ─────────────────────────────────────────────────────────────────────────────
class _LogoPill extends StatelessWidget {
  final ProjectData data;
  final Color accent;
  final PortfolioTheme theme;
  const _LogoPill({
    required this.data,
    required this.accent,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.42),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, size: 13, color: accent),
          const SizedBox(width: 6),
          Text(
            data.name,
            style: pStyle(
              size: 11,
              weight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.88),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STATUS BADGE
// ─────────────────────────────────────────────────────────────────────────────
class _StatusBadge extends StatelessWidget {
  final String status;
  final Color accent;
  final bool onImage;

  const _StatusBadge({
    required this.status,
    required this.accent,
    this.onImage = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        onImage
            ? Colors.black.withValues(alpha: 0.62)
            : accent.withValues(alpha: 0.12);
    final borderColor =
        onImage
            ? Colors.white.withValues(alpha: 0.18)
            : accent.withValues(alpha: 0.30);
    final textColor = onImage ? Colors.white : accent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: borderColor),
        boxShadow:
            onImage
                ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
                : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PulsingDot(color: accent, size: 5),
          const SizedBox(width: 5),
          Text(
            status,
            style: pStyle(size: 10, color: textColor, weight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DETAIL BOTTOM SHEET
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectDetailSheet extends StatelessWidget {
  final ProjectData data;
  final PortfolioTheme theme;
  const _ProjectDetailSheet({required this.data, required this.theme});

  Future<void> _launch(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) {
      _showLinkError(context, 'This project link is not valid.');
      return;
    }

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );

      if (!launched && context.mounted) {
        _showLinkError(context, 'Unable to open the project link right now.');
      }
    } catch (error) {
      debugPrint('Project link error: $error');

      if (context.mounted) {
        _showLinkError(context, 'Unable to open the project link right now.');
      }
    }
  }

  void _showLinkError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accent = projectAccent(data.color, theme);
    final isMobile = MediaQuery.of(context).size.width < 700;
    final hasImage = data.logoAsset != null && data.logoAsset!.isNotEmpty;

    return DraggableScrollableSheet(
      initialChildSize: 0.88,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder:
          (_, controller) => Container(
            decoration: BoxDecoration(
              color: theme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              border: Border.all(color: theme.border),
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    controller: controller,
                    padding: EdgeInsets.zero,
                    children: [
                      if (hasImage)
                        SizedBox(
                          height: 200,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(data.logoAsset!, fit: BoxFit.cover),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, theme.surface],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          isMobile ? 24 : 40,
                          hasImage ? 0 : 24,
                          isMobile ? 24 : 40,
                          24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    color: accent.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(13.0),
                                    border: Border.all(
                                      color: accent.withValues(alpha: 0.30),
                                    ),
                                  ),
                                  child: Icon(
                                    data.icon,
                                    color: accent,
                                    size: 30.0,
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.name,
                                        style: pStyle(
                                          size: 22,
                                          weight: FontWeight.w600,
                                          color: theme.text,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      if (data.status != null)
                                        _StatusBadge(
                                          status: data.status!,
                                          accent: accent,
                                        ),
                                    ],
                                  ),
                                ),
                                Material(
                                  color: theme.surface2,
                                  borderRadius: BorderRadius.circular(9),
                                  child: IconButton(
                                    tooltip: 'Close project details',
                                    onPressed: () => Navigator.pop(context),
                                    iconSize: 19.0,
                                    padding: const EdgeInsets.all(9.0),
                                    constraints: const BoxConstraints(
                                      minWidth: 36.0,
                                      minHeight: 36.0,
                                    ),
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: theme.muted,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 19.0),
                            Wrap(
                              spacing: 6.0,
                              runSpacing: 6.0,
                              children:
                                  data.badges
                                      .map((b) => PBadge(b, accent: accent))
                                      .toList(),
                            ),
                            const SizedBox(height: 20),
                            if (data.detailDescription != null) ...[
                              Text(
                                data.detailDescription!,
                                style: pStyle(
                                  size: 15,
                                  color: theme.muted,
                                  height: 1.75,
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                            if (data.highlights != null &&
                                data.highlights!.isNotEmpty) ...[
                              Text(
                                'Highlights',
                                style: pStyle(
                                  size: 13,
                                  color: theme.muted,
                                  weight: FontWeight.w600,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...data.highlights!.map(
                                (h) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_rounded,
                                        size: 16,
                                        color: accent,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          h,
                                          style: pStyle(
                                            size: 14,
                                            color: theme.text,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                            Text(
                              'Tech stack',
                              style: pStyle(
                                size: 13,
                                color: theme.muted,
                                weight: FontWeight.w600,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children:
                                  data.stack
                                      .map((t) => PTag(t, theme: theme))
                                      .toList(),
                            ),
                            const SizedBox(height: 32),
                            Divider(color: theme.border),
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                if (data.githubUrl != null)
                                  _LinkButton(
                                    label: 'View Code',
                                    fontAwesomeIcon: FontAwesomeIcons.github,
                                    accent: accent,
                                    theme: theme,
                                    onTap:
                                        () => _launch(context, data.githubUrl!),
                                  ),

                                if (data.appStoreUrl != null)
                                  _LinkButton(
                                    label: 'Visit site to download',
                                    materialIcon: Icons.language_rounded,
                                    accent: accent,
                                    theme: theme,
                                    onTap:
                                        () =>
                                            _launch(context, data.appStoreUrl!),
                                  ),

                                if (data.playStoreUrl != null)
                                  _LinkButton(
                                    label: 'Play Store',
                                    materialIcon: Icons.android_rounded,
                                    accent: accent,
                                    theme: theme,
                                    onTap:
                                        () => _launch(
                                          context,
                                          data.playStoreUrl!,
                                        ),
                                  ),

                                if (data.webUrl != null)
                                  _LinkButton(
                                    label: 'Live Demo',
                                    materialIcon: Icons.language_rounded,
                                    accent: accent,
                                    theme: theme,
                                    onTap: () => _launch(context, data.webUrl!),
                                    outlined: true,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LINK BUTTON
// ─────────────────────────────────────────────────────────────────────────────
class _LinkButton extends StatefulWidget {
  final String label;

  // Use one of these:
  final IconData? materialIcon;
  final FaIconData? fontAwesomeIcon;

  final Color accent;
  final PortfolioTheme theme;
  final VoidCallback onTap;
  final bool outlined;

  const _LinkButton({
    required this.label,
    required this.accent,
    required this.theme,
    required this.onTap,
    this.materialIcon,
    this.fontAwesomeIcon,
    this.outlined = false,
  }) : assert(
         materialIcon != null || fontAwesomeIcon != null,
         'Provide materialIcon or fontAwesomeIcon.',
       );

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final onAccent =
        widget.accent.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;

    final iconColor = widget.outlined ? widget.theme.text : onAccent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          widget.onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 13.0),
          decoration: BoxDecoration(
            color:
                widget.outlined
                    ? (_hovered ? widget.theme.border : Colors.transparent)
                    : (_hovered
                        ? widget.accent.withValues(alpha: 0.85)
                        : widget.accent),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.outlined ? widget.theme.border : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.fontAwesomeIcon != null)
                FaIcon(widget.fontAwesomeIcon, size: 16, color: iconColor)
              else
                Icon(widget.materialIcon, size: 16, color: iconColor),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: pStyle(
                  size: 14,
                  weight: FontWeight.w500,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
