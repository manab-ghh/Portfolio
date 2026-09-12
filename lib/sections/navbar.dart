import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/launcher.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String section) onNavTap;
  final VoidCallback? onMenuTap;
  final bool isScrolled;

  const NavBar({
    super.key,
    required this.onNavTap,
    this.onMenuTap,
    this.isScrolled = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 72,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
          ),
          decoration: BoxDecoration(
            color: isScrolled
                ? AppColors.bg.withValues(alpha: 0.85)
                : AppColors.bg.withValues(alpha: 0.6),
            border: Border(
              bottom: BorderSide(
                color: isScrolled
                    ? AppColors.borderSubtle
                    : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              _buildLogo(),

              // Navigation Links
              if (!isMobile) ...[
                Row(
                  children: [
                    _navItem('About', () => onNavTap('about')),
                    _navItem('Skills', () => onNavTap('skills')),
                    _navItem('Projects', () => onNavTap('projects')),
                    _navItem('Journey', () => onNavTap('experience')),
                    _navItem('Achievements', () => onNavTap('achievements')),
                    _navItem('Profiles', () => onNavTap('profiles')),
                    _navItem('Contact', () => onNavTap('contact')),
                    const SizedBox(width: 16),
                    _buildResumeButton(),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                      onPressed: onMenuTap,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return InkWell(
      onTap: () => onNavTap('hero'),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: AppRadius.radiusSm,
            ),
            child: const Text(
              'M',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'MANAB',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String label, VoidCallback onTap) {
    return _NavHoverItem(label: label, onTap: onTap);
  }

  Widget _buildResumeButton() {
    return InkWell(
      onTap: () => UrlHelper.launch(PortfolioData.resumeUrl),
      borderRadius: AppRadius.radiusMd,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: AppRadius.radiusMd,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.25),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(FontAwesomeIcons.download, size: 12, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Resume',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavHoverItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavHoverItem({required this.label, required this.onTap});

  @override
  State<_NavHoverItem> createState() => _NavHoverItemState();
}

class _NavHoverItemState extends State<_NavHoverItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              color: _isHovered ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
