import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                tag: 'About Me',
                title: 'Engineering Mindset & Technical Foundations',
                subtitle:
                    'Bridging deep algorithmic understanding with modern full-stack development and artificial intelligence.',
              ),
              if (isMobile) ...[
                _buildDeveloperCard(isMobile: true),
                const SizedBox(height: AppSpacing.xl),
                _buildBioContent(),
              ] else ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: _buildDeveloperCard(isMobile: false),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 6,
                      child: _buildBioContent(),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: AppSpacing.xxl),
              // Stats Grid
              _buildStatsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperCard({required bool isMobile}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Terminal Window Title Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg - 1)),
              border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
            ),
            child: Row(
              children: [
                Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFF5F56), shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFFBD2E), shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF27C93F), shape: BoxShape.circle)),
                const SizedBox(width: 14),
                const Text(
                  'manab@workstation:~',
                  style: TextStyle(
                    fontFamily: 'Fira Code',
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _terminalLine(r'$ whoami', 'manabendra_mondal'),
                const SizedBox(height: 10),
                _terminalLine(r'$ focus', 'Backend, Flutter & AI Systems'),
                const SizedBox(height: 10),
                _terminalLine(r'$ location', 'Kolkata, WB, India 🇮🇳'),
                const SizedBox(height: 10),
                _terminalLine(r'$ languages', 'C++, Dart, JS, Python, SQL'),
                const SizedBox(height: 10),
                _terminalLine(r'$ dsa_problems', '500+ Solved (LC/CF)'),
                const SizedBox(height: 10),
                _terminalLine(r'$ status', '🟢 Open for Opportunities'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _terminalLine(String prompt, String output) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prompt,
          style: const TextStyle(
            fontFamily: 'Fira Code',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.cyan,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          output,
          style: const TextStyle(
            fontFamily: 'Fira Code',
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBioContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Who I Am',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          PortfolioData.fullBio,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.7,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Core Pillars
        _buildPillar(
          icon: FontAwesomeIcons.terminal,
          title: 'Algorithmic Rigor (C++ & DSA)',
          description:
              '500+ problems solved with strong mastery over graph theory, dynamic programming, and data structures.',
        ),
        _buildPillar(
          icon: FontAwesomeIcons.server,
          title: 'Scalable Backend Services (Node.js & Go)',
          description:
              'Designing RESTful and asynchronous architectures with SQL/NoSQL databases and containerization.',
        ),
        _buildPillar(
          icon: FontAwesomeIcons.mobileScreen,
          title: 'Cross-Platform Mastery (Flutter)',
          description:
              'Crafting responsive, resilient user interfaces with clean architecture and reactive state management.',
        ),
        _buildPillar(
          icon: FontAwesomeIcons.brain,
          title: 'Applied AI & LLMs',
          description:
              'Integrating generative models, embeddings, and autonomous agent loops into production applications.',
        ),
      ],
    );
  }

  Widget _buildPillar({
    required dynamic icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: AppRadius.radiusSm,
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: AppIcon(icon, size: 14, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 650;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isNarrow ? 2 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isNarrow ? 1.6 : 2.0,
          ),
          itemCount: PortfolioData.stats.length,
          itemBuilder: (context, index) {
            final stat = PortfolioData.stats[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.radiusMd,
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) =>
                        AppColors.primaryGradient.createShader(bounds),
                    child: Text(
                      stat['value']!,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stat['label']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
