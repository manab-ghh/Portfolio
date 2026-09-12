import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/launcher.dart';
import '../utils/responsive.dart';
import '../widgets/animated_text.dart';
import '../widgets/app_icon.dart';
import '../widgets/social_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExploreWorkTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onExploreWorkTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Stack(
      children: [
        // Subtle ambient radial glow behind hero
        Positioned(
          top: -60,
          left: isMobile ? -50 : 100,
          child: Container(
            width: isMobile ? 260 : 450,
            height: isMobile ? 260 : 450,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.16),
                  AppColors.secondary.withValues(alpha: 0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          right: isMobile ? -50 : 120,
          child: Container(
            width: isMobile ? 240 : 400,
            height: isMobile ? 240 : 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.cyan.withValues(alpha: 0.12),
                  AppColors.primary.withValues(alpha: 0.05),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Main Hero Content
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: isMobile ? 40 : 70,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 950),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Status Badge
                  _buildStatusBadge(),
                  const SizedBox(height: AppSpacing.lg),

                  // Intro Greeting
                  Text(
                    "Hello world, I'm",
                    style: TextStyle(
                      fontFamily: 'Fira Code',
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cyan,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),

                  // Name Headline
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.white, Color(0xFFE2E8F0), AppColors.primary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      PortfolioData.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: isMobile ? 36 : (isTablet ? 52 : 64),
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.5,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Typing Roles
                  SizedBox(
                    height: isMobile ? 54 : 36,
                    child: Center(
                      child: TypewriterAnimatedText(
                        texts: PortfolioData.heroRoles,
                        style: TextStyle(
                          fontFamily: 'Fira Code',
                          fontSize: isMobile ? 15 : 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  // Short Bio
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Text(
                      PortfolioData.shortBio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: isMobile ? 14 : 17,
                        color: AppColors.textSecondary,
                        height: 1.65,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),

                  // Call to Action Buttons
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 14,
                    children: [
                      // View My Work
                      _buildPrimaryButton(
                        label: 'View Featured Work',
                        icon: FontAwesomeIcons.arrowDown,
                        onTap: onExploreWorkTap,
                      ),
                      // Contact
                      _buildSecondaryButton(
                        label: "Let's Connect",
                        icon: FontAwesomeIcons.envelope,
                        onTap: onContactTap,
                      ),
                      // Resume
                      _buildSecondaryButton(
                        label: 'Get Resume',
                        icon: FontAwesomeIcons.download,
                        onTap: () => UrlHelper.launch(PortfolioData.resumeUrl),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xxl),

                  // Social Icons Row
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      SocialButton(
                        icon: FontAwesomeIcons.github,
                        tooltip: 'GitHub Profile',
                        url: PortfolioData.githubUrl,
                        color: Color(0xFFF0F6FC),
                      ),
                      SocialButton(
                        icon: FontAwesomeIcons.linkedin,
                        tooltip: 'LinkedIn Profile',
                        url: PortfolioData.linkedinUrl,
                        color: Color(0xFF0A66C2),
                      ),
                      SocialButton(
                        icon: FontAwesomeIcons.code,
                        tooltip: 'LeetCode Profile',
                        url: PortfolioData.leetcodeUrl,
                        color: Color(0xFFFFA116),
                      ),
                      SocialButton(
                        icon: FontAwesomeIcons.trophy,
                        tooltip: 'Codeforces Profile',
                        url: PortfolioData.codeforcesUrl,
                        color: Color(0xFF1F8ACB),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated.withValues(alpha: 0.8),
        borderRadius: AppRadius.radiusPill,
        border: Border.all(
          color: AppColors.emerald.withValues(alpha: 0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.emerald.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.emerald,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.emerald.withValues(alpha: 0.7),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            PortfolioData.availabilityStatus,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE2E8F0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required dynamic icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.radiusMd,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: AppRadius.radiusMd,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.35),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            AppIcon(icon, size: 13, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required String label,
    required dynamic icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.radiusMd,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated.withValues(alpha: 0.8),
          borderRadius: AppRadius.radiusMd,
          border: Border.all(
            color: AppColors.borderSubtle,
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon, size: 13, color: AppColors.textPrimary),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
