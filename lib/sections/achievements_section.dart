import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../models/achievement.dart';
import '../utils/launcher.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';
import '../widgets/section_title.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: isMobile ? AppSpacing.sectionMobile : AppSpacing.section,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              const SectionTitle(
                tag: 'Honors & Competitions',
                title: 'Achievements & Hackathons',
                subtitle:
                    'Podium finishes, recognized solutions, and competitive technology challenges.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 800;

                  return Column(
                    children: [
                      for (int i = 0; i < PortfolioData.achievements.length; i += (isWide ? 2 : 1)) ...[
                        if (isWide && i + 1 < PortfolioData.achievements.length) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildAchievementCard(PortfolioData.achievements[i])),
                              const SizedBox(width: 24),
                              Expanded(child: _buildAchievementCard(PortfolioData.achievements[i + 1])),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ] else ...[
                          _buildAchievementCard(PortfolioData.achievements[i]),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementCard(AchievementItem item) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Trophy icon + Badge & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.amber.withValues(alpha: 0.12),
                  borderRadius: AppRadius.radiusMd,
                  border: Border.all(color: AppColors.amber.withValues(alpha: 0.3)),
                ),
                child: const AppIcon(
                  FontAwesomeIcons.trophy,
                  size: 16,
                  color: AppColors.amber,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.amber.withValues(alpha: 0.15),
                      borderRadius: AppRadius.radiusPill,
                      border: Border.all(color: AppColors.amber.withValues(alpha: 0.4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppIcon(FontAwesomeIcons.award, size: 11, color: AppColors.amber),
                        const SizedBox(width: 6),
                        Text(
                          item.badge,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.date,
                    style: const TextStyle(
                      fontFamily: 'Fira Code',
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

                // Title
                Text(
                  item.title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),

                // Organizer
                Text(
                  item.organizer,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),

                // Description
                Text(
                  item.description,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),

                if (item.credentialUrl != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  InkWell(
                    onTap: () => UrlHelper.launch(item.credentialUrl!),
                    borderRadius: AppRadius.radiusSm,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View Details / Verification',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cyan,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_outward_rounded, size: 14, color: AppColors.cyan),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        }
}
