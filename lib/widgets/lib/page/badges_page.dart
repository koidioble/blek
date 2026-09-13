import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koidio_ble/pages/my/my_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────────────────────────────────────
enum BadgeCategory { azure, aws, leadership }

class BadgeItem {
  final String name;
  final String date;
  final BadgeCategory category;
  final IconData icon;

  const BadgeItem({
    required this.name,
    required this.date,
    required this.category,
    required this.icon,
  });
}

const List<BadgeItem> _badges = [
  BadgeItem(
    name: 'Azure Network Security',
    date: 'Apr 14, 2026',
    category: BadgeCategory.azure,
    icon: Icons.security_rounded,
  ),
  BadgeItem(
    name: 'Azure Network Infrastructure',
    date: 'Apr 11, 2026',
    category: BadgeCategory.azure,
    icon: Icons.lan_rounded,
  ),
  BadgeItem(
    name: 'Azure Resource Management Hierarchy',
    date: 'Apr 11, 2026',
    category: BadgeCategory.azure,
    icon: Icons.account_tree_rounded,
  ),
  BadgeItem(
    name: 'Azure High Availability & Load Balancing',
    date: 'Apr 11, 2026',
    category: BadgeCategory.azure,
    icon: Icons.balance_rounded,
  ),
  BadgeItem(
    name: 'Azure Cloud Computing Concepts',
    date: 'Apr 10, 2026',
    category: BadgeCategory.azure,
    icon: Icons.cloud_rounded,
  ),
  BadgeItem(
    name: 'AWS Solutions Architect: Network Infrastructure',
    date: 'Mar 25, 2026',
    category: BadgeCategory.aws,
    icon: Icons.hub_rounded,
  ),
  BadgeItem(
    name: 'AWS Solutions Architect: General Architecture',
    date: 'Mar 25, 2026',
    category: BadgeCategory.aws,
    icon: Icons.architecture_rounded,
  ),
  BadgeItem(
    name: 'Leadership Insights on Leading with Agility',
    date: 'Mar 15, 2026',
    category: BadgeCategory.leadership,
    icon: Icons.emoji_events_rounded,
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// THEME HELPERS
// ─────────────────────────────────────────────────────────────────────────────
extension _BadgeCategoryX on BadgeCategory {
  String get label {
    switch (this) {
      case BadgeCategory.azure:
        return 'Azure Fundamentals';
      case BadgeCategory.aws:
        return 'AWS Professional';
      case BadgeCategory.leadership:
        return 'Leadership';
    }
  }

  String get filterLabel {
    switch (this) {
      case BadgeCategory.azure:
        return 'Microsoft Azure';
      case BadgeCategory.aws:
        return 'AWS';
      case BadgeCategory.leadership:
        return 'Leadership';
    }
  }

  Color ringColor(bool isDark) {
    switch (this) {
      case BadgeCategory.azure:
        return isDark ? const Color(0xFF185FA5) : const Color(0xFF378ADD);
      case BadgeCategory.aws:
        return isDark ? const Color(0xFFBA7517) : const Color(0xFFEF9F27);
      case BadgeCategory.leadership:
        return isDark ? const Color(0xFF534AB7) : const Color(0xFF7F77DD);
    }
  }

  Color ringBg(bool isDark) {
    switch (this) {
      case BadgeCategory.azure:
        return isDark
            ? const Color(0xFF0C447C).withValues(alpha: 0.4)
            : const Color(0xFFE6F1FB);
      case BadgeCategory.aws:
        return isDark
            ? const Color(0xFF633806).withValues(alpha: 0.4)
            : const Color(0xFFFAEEDA);
      case BadgeCategory.leadership:
        return isDark
            ? const Color(0xFF3C3489).withValues(alpha: 0.4)
            : const Color(0xFFEEEDFE);
    }
  }

  Color tagText(bool isDark) {
    switch (this) {
      case BadgeCategory.azure:
        return isDark ? const Color(0xFF85B7EB) : const Color(0xFF185FA5);
      case BadgeCategory.aws:
        return isDark ? const Color(0xFFFAC775) : const Color(0xFF854F0B);
      case BadgeCategory.leadership:
        return isDark ? const Color(0xFFAFA9EC) : const Color(0xFF534AB7);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BADGES PAGE
// ─────────────────────────────────────────────────────────────────────────────
class BadgesPage extends StatefulWidget {
  const BadgesPage({super.key});

  @override
  State<BadgesPage> createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage>
    with SingleTickerProviderStateMixin {
  BadgeCategory? _activeFilter;

  // Stagger controller for card entry animation
  late AnimationController _staggerCtrl;
  final List<Animation<double>> _cardAnims = [];

  @override
  void initState() {
    super.initState();
    _staggerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _buildCardAnims(_badges.length);
    _staggerCtrl.forward();
  }

  void _buildCardAnims(int count) {
    _cardAnims.clear();
    for (int i = 0; i < count; i++) {
      final start = (i * 0.1).clamp(0.0, 1.0);
      final end = (start + 0.5).clamp(0.0, 1.0);
      _cardAnims.add(
        CurvedAnimation(
          parent: _staggerCtrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );
    }
  }

  void _applyFilter(BadgeCategory? cat) {
    setState(() => _activeFilter = cat);
    // Re-run stagger when filter changes
    _staggerCtrl.reset();
    final count =
        cat == null
            ? _badges.length
            : _badges.where((b) => b.category == cat).length;
    _buildCardAnims(count);
    _staggerCtrl.forward();
  }

  List<BadgeItem> get _filtered =>
      _activeFilter == null
          ? _badges
          : _badges.where((b) => b.category == _activeFilter).toList();

  int _countFor(BadgeCategory cat) =>
      _badges.where((b) => b.category == cat).length;

  @override
  void dispose() {
    _staggerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bg = isDark ? oliveDark : lightCream;
    final Color accent = isDark ? turquoise : oliveDrab;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: accent, size: 20),
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'My Badges',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : const Color(0xFF1A1A2E),
          ),
        ),
        actions: [
          _StatPill(
            label: '${_countFor(BadgeCategory.azure)} Azure',
            color: const Color(0xFF378ADD),
            bg: const Color(0xFFE6F1FB),
            isDark: isDark,
          ),
          const SizedBox(width: 6),
          _StatPill(
            label: '${_countFor(BadgeCategory.aws)} AWS',
            color: const Color(0xFFEF9F27),
            bg: const Color(0xFFFAEEDA),
            isDark: isDark,
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: accent.withValues(alpha: 0.15),
          ),
          _FilterBar(
            activeFilter: _activeFilter,
            totalCount: _badges.length,
            isDark: isDark,
            accent: accent,
            onFilter: _applyFilter,
          ),
          Expanded(
            child:
                _filtered.isEmpty
                    ? Center(
                      child: Text(
                        'No badges in this category yet.',
                        style: TextStyle(
                          color: isDark ? Colors.white38 : Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    )
                    : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.82,
                          ),
                      itemCount: _filtered.length,
                      itemBuilder: (ctx, i) {
                        final anim =
                            i < _cardAnims.length
                                ? _cardAnims[i]
                                : const AlwaysStoppedAnimation(1.0);
                        return AnimatedBuilder(
                          animation: anim,
                          builder:
                              (_, child) => Transform.translate(
                                offset: Offset(0, 30 * (1 - anim.value)),
                                child: Opacity(
                                  opacity: anim.value.clamp(0.0, 1.0),
                                  child: child,
                                ),
                              ),
                          child: _BadgeCard(
                            badge: _filtered[i],
                            isDark: isDark,
                            accent: accent,
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STAT PILL
// ─────────────────────────────────────────────────────────────────────────────
class _StatPill extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;
  final bool isDark;

  const _StatPill({
    required this.label,
    required this.color,
    required this.bg,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isDark ? color.withValues(alpha: 0.15) : bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FILTER BAR
// ─────────────────────────────────────────────────────────────────────────────
class _FilterBar extends StatelessWidget {
  final BadgeCategory? activeFilter;
  final int totalCount;
  final bool isDark;
  final Color accent;
  final void Function(BadgeCategory?) onFilter;

  const _FilterBar({
    required this.activeFilter,
    required this.totalCount,
    required this.isDark,
    required this.accent,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    final filters = <(BadgeCategory?, String)>[
      (null, 'All ($totalCount)'),
      (BadgeCategory.azure, BadgeCategory.azure.filterLabel),
      (BadgeCategory.aws, BadgeCategory.aws.filterLabel),
      (BadgeCategory.leadership, BadgeCategory.leadership.filterLabel),
    ];

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (ctx, i) {
          final (cat, label) = filters[i];
          final isActive = activeFilter == cat;
          return GestureDetector(
            onTap: () => onFilter(cat),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color:
                    isActive
                        ? accent
                        : (isDark
                            ? const Color(0xFF1C2128)
                            : const Color(0xFFF0F2F5)),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      isActive
                          ? accent
                          : (isDark ? seafoamGreen : oliveDrab).withValues(
                            alpha: 0.3,
                          ),
                  width: 1,
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color:
                      isActive
                          ? (isDark ? oliveDark : Colors.white)
                          : (isDark ? Colors.white70 : Colors.black87),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BADGE CARD
// ─────────────────────────────────────────────────────────────────────────────
class _BadgeCard extends StatefulWidget {
  final BadgeItem badge;
  final bool isDark;
  final Color accent;

  const _BadgeCard({
    required this.badge,
    required this.isDark,
    required this.accent,
  });

  @override
  State<_BadgeCard> createState() => _BadgeCardState();
}

class _BadgeCardState extends State<_BadgeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressCtrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _pressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final badge = widget.badge;
    final isDark = widget.isDark;
    final accent = widget.accent;
    final Color cardBg =
        isDark ? const Color(0xFF1C2128) : const Color(0xFFFFFFFF);

    return GestureDetector(
      onTapDown: (_) {
        _pressCtrl.forward();
        HapticFeedback.lightImpact();
      },
      onTapUp: (_) => _pressCtrl.reverse(),
      onTapCancel: () => _pressCtrl.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: isDark ? seafoamGreen : oliveDrab,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Badge ring
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: badge.category.ringBg(isDark),
                  border: Border.all(
                    color: badge.category.ringColor(isDark),
                    width: 2.5,
                  ),
                ),
                child: Icon(
                  badge.icon,
                  size: 30,
                  color: badge.category.ringColor(isDark),
                ),
              ),
              const SizedBox(height: 10),

              // Badge name
              Text(
                badge.name,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 6),

              // Date
              Text(
                badge.date,
                style: TextStyle(
                  fontSize: 13.0,
                  color: isDark ? Colors.white38 : Colors.black38,
                ),
              ),
              const SizedBox(height: 9.0),

              // Category tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: badge.category.ringBg(isDark),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: badge.category
                        .ringColor(isDark)
                        .withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: Text(
                  badge.category.label,
                  style: TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.w600,
                    color: badge.category.tagText(isDark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
