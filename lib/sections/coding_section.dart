import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/launcher.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';
import '../widgets/section_title.dart';

class CodingSection extends StatelessWidget {
  const CodingSection({super.key});

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
                tag: 'Competitive Programming',
                title: 'Coding Profiles & Problem Solving',
                subtitle:
                    'Dedicated to algorithmic challenges, speed, space efficiency, and continuous competitive practice.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 800;
                  final count = isWide ? 4 : (constraints.maxWidth > 500 ? 2 : 1);

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: count,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isWide ? 1.05 : 1.35,
                    ),
                    itemCount: PortfolioData.codingProfiles.length,
                    itemBuilder: (context, index) {
                      final profile = PortfolioData.codingProfiles[index];
                      return _CodingProfileCard(profile: profile);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CodingProfileCard extends StatefulWidget {
  final Map<String, dynamic> profile;

  const _CodingProfileCard({required this.profile});

  @override
  State<_CodingProfileCard> createState() => _CodingProfileCardState();
}

class _CodingProfileCardState extends State<_CodingProfileCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.profile['color'] as Color;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => UrlHelper.launch(widget.profile['url'] as String),
        child: AnimatedScale(
          scale: _isHovered ? 1.025 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.surfaceElevated : AppColors.surface,
              borderRadius: AppRadius.radiusLg,
              border: Border.all(
                color: _isHovered ? color.withValues(alpha: 0.6) : AppColors.borderSubtle,
                width: 1.2,
              ),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: color.withValues(alpha: 0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  )
                else
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                  ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                        borderRadius: AppRadius.radiusMd,
                      ),
                      child: AppIcon(
                        widget.profile['icon'],
                        size: 20,
                        color: color,
                      ),
                    ),
                    Icon(
                      Icons.arrow_outward_rounded,
                      size: 16,
                      color: _isHovered ? color : AppColors.textMuted,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.profile['platform'] as String,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '@${widget.profile['username']}',
                      style: const TextStyle(
                        fontFamily: 'Fira Code',
                        fontSize: 12,
                        color: AppColors.cyan,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.profile['stats'] as String,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                    Text(
                      widget.profile['subtext'] as String,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
