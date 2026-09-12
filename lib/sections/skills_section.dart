import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../models/skill.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                tag: 'Skills & Tech Stack',
                title: 'Tools, Frameworks & Languages',
                subtitle:
                    'Engineered with modern technologies across backend, mobile, systems, and artificial intelligence.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 750;

                  return Column(
                    children: [
                      for (int i = 0; i < PortfolioData.skillCategories.length; i += (isWide ? 2 : 1)) ...[
                        if (isWide && i + 1 < PortfolioData.skillCategories.length) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildCategoryCard(PortfolioData.skillCategories[i])),
                              const SizedBox(width: 20),
                              Expanded(child: _buildCategoryCard(PortfolioData.skillCategories[i + 1])),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ] else ...[
                          _buildCategoryCard(PortfolioData.skillCategories[i]),
                          const SizedBox(height: 20),
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

  Widget _buildCategoryCard(SkillCategory category) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: AppRadius.radiusMd,
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
                ),
                child: AppIcon(
                  category.icon,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      category.subtitle,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: category.skills.map<Widget>((skill) {
              return SkillCard(skill: skill);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
