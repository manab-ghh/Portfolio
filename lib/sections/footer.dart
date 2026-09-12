import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/social_button.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onBackToTop;

  const FooterSection({
    super.key,
    required this.onBackToTop,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: 36,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo + subtitle
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: AppRadius.radiusSm,
                        ),
                        child: const Text(
                          'M',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        PortfolioData.name,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Back to top button
                  InkWell(
                    onTap: onBackToTop,
                    borderRadius: AppRadius.radiusMd,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated,
                        borderRadius: AppRadius.radiusMd,
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_upward_rounded, size: 14, color: AppColors.primary),
                          SizedBox(width: 6),
                          Text(
                            'Back to Top',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              Divider(color: AppColors.borderSubtle.withValues(alpha: 0.5), height: 1),
              const SizedBox(height: AppSpacing.lg),

              if (isMobile) ...[
                const Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    SocialButton(icon: FontAwesomeIcons.github, tooltip: 'GitHub', url: PortfolioData.githubUrl, size: 36),
                    SocialButton(icon: FontAwesomeIcons.linkedin, tooltip: 'LinkedIn', url: PortfolioData.linkedinUrl, size: 36),
                    SocialButton(icon: FontAwesomeIcons.code, tooltip: 'LeetCode', url: PortfolioData.leetcodeUrl, size: 36),
                    SocialButton(icon: FontAwesomeIcons.trophy, tooltip: 'Codeforces', url: PortfolioData.codeforcesUrl, size: 36),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Designed & Built with Flutter Web • © ${DateTime.now().year}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ] else ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Designed & Built with Flutter Web • © ${DateTime.now().year} ${PortfolioData.name}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const Row(
                      children: [
                        SocialButton(icon: FontAwesomeIcons.github, tooltip: 'GitHub', url: PortfolioData.githubUrl, size: 36),
                        SizedBox(width: 10),
                        SocialButton(icon: FontAwesomeIcons.linkedin, tooltip: 'LinkedIn', url: PortfolioData.linkedinUrl, size: 36),
                        SizedBox(width: 10),
                        SocialButton(icon: FontAwesomeIcons.code, tooltip: 'LeetCode', url: PortfolioData.leetcodeUrl, size: 36),
                        SizedBox(width: 10),
                        SocialButton(icon: FontAwesomeIcons.trophy, tooltip: 'Codeforces', url: PortfolioData.codeforcesUrl, size: 36),
                      ],
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
}
