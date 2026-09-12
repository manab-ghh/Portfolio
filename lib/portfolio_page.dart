import 'package:flutter/material.dart';
import 'core/colors.dart';
import 'sections/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/terminal_section.dart';
import 'sections/about_section.dart';
import 'sections/building_section.dart';
import 'sections/tech_stack_section.dart';
import 'sections/skill_levels_section.dart';
import 'sections/projects_section.dart';
import 'sections/github_stats_section.dart';
import 'sections/profiles_section.dart';
import 'sections/roadmap_section.dart';
import 'sections/philosophy_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

/// The main portfolio page — assembles all sections with smooth scrolling.
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollCtrl = ScrollController();

  // Keys for scroll-to-section
  final _heroKey    = GlobalKey();
  final _aboutKey   = GlobalKey();
  final _skillsKey  = GlobalKey();
  final _projectKey = GlobalKey();
  final _statsKey   = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        controller: _scrollCtrl,
        slivers: [
          // ── Sticky nav bar ─────────────────────────────────────────
          SliverPersistentHeader(
            pinned: true,
            delegate: NavBarDelegate(
              onHome:     () => _scrollTo(_heroKey),
              onAbout:    () => _scrollTo(_aboutKey),
              onSkills:   () => _scrollTo(_skillsKey),
              onProjects: () => _scrollTo(_projectKey),
              onStats:    () => _scrollTo(_statsKey),
              onContact:  () => _scrollTo(_contactKey),
            ),
          ),

          // ── Content sections ────────────────────────────────────────
          SliverToBoxAdapter(
            child: Column(
              children: [
                HeroSection(key: _heroKey),
                _Divider(),
                TerminalSection(),
                _Divider(),
                AboutSection(key: _aboutKey),
                _Divider(),
                BuildingSection(),
                _Divider(),
                TechStackSection(),
                _Divider(),
                SkillLevelsSection(key: _skillsKey),
                _Divider(),
                ProjectsSection(key: _projectKey),
                _Divider(),
                GithubStatsSection(key: _statsKey),
                _Divider(),
                ProfilesSection(),
                _Divider(),
                RoadmapSection(),
                _Divider(),
                PhilosophySection(),
                _Divider(),
                ContactSection(key: _contactKey),
                FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.border,
      height: 1,
      indent: 24,
      endIndent: 24,
    );
  }
}
