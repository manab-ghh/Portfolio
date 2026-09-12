import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../models/project.dart';
import '../utils/launcher.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedFilter = 'All';

  final List<String> _filters = ['All', 'AI & Agents', 'Backend & Cloud', 'Flutter & Mobile', 'C++ & Algorithms'];

  List<ProjectModel> get _filteredProjects {
    if (_selectedFilter == 'All') {
      return PortfolioData.projects;
    } else if (_selectedFilter == 'AI & Agents') {
      return PortfolioData.projects
          .where((p) =>
              p.category.toLowerCase().contains('ai') ||
              p.technologies.any((t) => t.toLowerCase().contains('ai') || t.toLowerCase().contains('langchain') || t.toLowerCase().contains('agent')))
          .toList();
    } else if (_selectedFilter == 'Backend & Cloud') {
      return PortfolioData.projects
          .where((p) =>
              p.category.toLowerCase().contains('backend') ||
              p.technologies.any((t) => t.toLowerCase().contains('node') || t.toLowerCase().contains('express') || t.toLowerCase().contains('api')))
          .toList();
    } else if (_selectedFilter == 'Flutter & Mobile') {
      return PortfolioData.projects
          .where((p) => p.technologies.any((t) => t.toLowerCase().contains('flutter')))
          .toList();
    } else {
      return PortfolioData.projects
          .where((p) => p.technologies.any((t) => t.toLowerCase().contains('c++') || t.toLowerCase().contains('algorithms')))
          .toList();
    }
  }

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
                tag: 'Featured Projects',
                title: 'Crafted Solutions & Applied Engineering',
                subtitle:
                    'Real-world software built with performance, security, and delightful user experience in mind.',
              ),

              // Filter Chips
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return InkWell(
                    onTap: () => setState(() => _selectedFilter = filter),
                    borderRadius: AppRadius.radiusPill,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.surfaceElevated.withValues(alpha: 0.6),
                        borderRadius: AppRadius.radiusPill,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.borderSubtle,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Projects Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 800;

                  return Column(
                    children: [
                      for (int i = 0; i < _filteredProjects.length; i += (isWide ? 2 : 1)) ...[
                        if (isWide && i + 1 < _filteredProjects.length) ...[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: ProjectCard(project: _filteredProjects[i])),
                              const SizedBox(width: 24),
                              Expanded(child: ProjectCard(project: _filteredProjects[i + 1])),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ] else ...[
                          ProjectCard(project: _filteredProjects[i]),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),

              // View all on GitHub button
              InkWell(
                onTap: () => UrlHelper.launch(PortfolioData.githubUrl),
                borderRadius: AppRadius.radiusMd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: AppRadius.radiusMd,
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppIcon(FontAwesomeIcons.github, size: 16, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Explore More Projects on GitHub',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
                    ],
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
