import 'package:flutter/material.dart';
import '../core/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onStats,
    required this.onContact,
  });

  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onStats;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bg.withAlpha(230),
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border)),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            final wide = constraints.maxWidth >= 700;
            return Row(
              children: [
                const SizedBox(width: 24),
                // Logo
                GestureDetector(
                  onTap: onHome,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.accentGlow,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: AppColors.accent, width: 1),
                        ),
                        child: const Icon(
                          Icons.terminal,
                          color: AppColors.accent,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'manab.dev',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (wide) ...[
                  _NavLink('Home', onHome),
                  _NavLink('About', onAbout),
                  _NavLink('Skills', onSkills),
                  _NavLink('Projects', onProjects),
                  _NavLink('Stats', onStats),
                  _NavLink('Contact', onContact),
                ],
                const SizedBox(width: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accentGlow : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovered ? AppColors.accent : AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// SliverPersistentHeader delegate that wraps [NavBar].
class NavBarDelegate extends SliverPersistentHeaderDelegate {
  const NavBarDelegate({
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onStats,
    required this.onContact,
  });

  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onStats;
  final VoidCallback onContact;

  @override
  double get minExtent => 64;
  @override
  double get maxExtent => 64;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return NavBar(
      onHome: onHome,
      onAbout: onAbout,
      onSkills: onSkills,
      onProjects: onProjects,
      onStats: onStats,
      onContact: onContact,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate old) => false;
}
