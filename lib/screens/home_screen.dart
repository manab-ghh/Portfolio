import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../sections/about_section.dart';
import '../sections/achievements_section.dart';
import '../sections/coding_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer.dart';
import '../sections/hero_section.dart';
import '../sections/navbar.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../utils/launcher.dart';
import '../widgets/app_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _profilesKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final scrolled = _scrollController.offset > 50;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onNavTap(String section) {
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }

    switch (section) {
      case 'hero':
        _scrollTo(_heroKey);
        break;
      case 'about':
        _scrollTo(_aboutKey);
        break;
      case 'skills':
        _scrollTo(_skillsKey);
        break;
      case 'projects':
        _scrollTo(_projectsKey);
        break;
      case 'experience':
        _scrollTo(_experienceKey);
        break;
      case 'achievements':
        _scrollTo(_achievementsKey);
        break;
      case 'profiles':
        _scrollTo(_profilesKey);
        break;
      case 'education':
        _scrollTo(_educationKey);
        break;
      case 'contact':
        _scrollTo(_contactKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bg,
      endDrawer: _buildMobileDrawer(),
      body: Stack(
        children: [
          // Scrollable Sections
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 72), // Offset for sticky navbar
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onExploreWorkTap: () => _scrollTo(_projectsKey),
                    onContactTap: () => _scrollTo(_contactKey),
                  ),
                ),
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),
                Container(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),
                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),
                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),
                Container(
                  key: _achievementsKey,
                  child: const AchievementsSection(),
                ),
                Container(
                  key: _profilesKey,
                  child: const CodingSection(),
                ),
                Container(
                  key: _educationKey,
                  child: const EducationSection(),
                ),
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
                FooterSection(
                  onBackToTop: () => _scrollTo(_heroKey),
                ),
              ],
            ),
          ),

          // Top Sticky NavBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onNavTap: _onNavTap,
              onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
              isScrolled: _isScrolled,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drawer Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      const Text(
                        'MANAB.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: AppColors.borderSubtle),
              const SizedBox(height: 12),

              // Drawer Nav Links
              _drawerItem('About', () => _onNavTap('about')),
              _drawerItem('Skills', () => _onNavTap('skills')),
              _drawerItem('Projects', () => _onNavTap('projects')),
              _drawerItem('Journey', () => _onNavTap('experience')),
              _drawerItem('Achievements', () => _onNavTap('achievements')),
              _drawerItem('Coding Profiles', () => _onNavTap('profiles')),
              _drawerItem('Education', () => _onNavTap('education')),
              _drawerItem('Contact', () => _onNavTap('contact')),

              const Spacer(),

              // Resume button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    UrlHelper.launch(PortfolioData.resumeUrl);
                  },
                  icon: const AppIcon(FontAwesomeIcons.download, size: 14),
                  label: const Text(
                    'Get Resume',
                    style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.radiusMd,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.textMuted),
      onTap: onTap,
    );
  }
}
