import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';
import '../widgets/typing_text.dart';
import '../widgets/buttons.dart';

const _kRoles = [
  'Computer Science Engineering Student',
  'Competitive Programmer | C++ & DSA',
  'Backend Developer | Node.js & Express',
  'Flutter Developer | Cross-Platform Apps',
  'AI / ML Explorer | LLMs & GenAI',
  'Agentic AI & LangChain Enthusiast',
  'Building Intelligent Software Systems',
];

const _kSocials = [
  _Social('GitHub',     Icons.code,        'https://github.com/manab-ghh',                                   Color(0xFF181717)),
  _Social('LinkedIn',   Icons.work,         'https://www.linkedin.com/in/manabendra-mondal-22254434a',        Color(0xFF0A66C2)),
  _Social('Codeforces', Icons.leaderboard,  'https://codeforces.com/profile/manab.code',                     Color(0xFF1F8ACB)),
  _Social('LeetCode',   Icons.psychology,   'https://www.leetcode.com/manab__344',                           Color(0xFFFFA116), textColor: Colors.black),
  _Social('Twitter/X',  Icons.close,        'https://twitter.com/@manabendra87314',                          Colors.black),
  _Social('Kaggle',     Icons.science,      'https://kaggle.com/manabendramondal',                           Color(0xFF20BEFF)),
  _Social('Portfolio',  Icons.language,     'https://portfolio-37689.web.app',                               Color(0xFFFF5722)),
  _Social('Email',      Icons.email,        'mailto:manabendra2006mondal@gmail.com',                         Color(0xFFEA4335)),
];

class _Social {
  final String label;
  final IconData icon;
  final String url;
  final Color bg;
  final Color textColor;
  const _Social(this.label, this.icon, this.url, this.bg,
      {this.textColor = Colors.white});
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        children: [
          const SizedBox(height: 48),
          // Profile photo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.accent, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withAlpha(80),
                  blurRadius: 30,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/photo.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.surface,
                  alignment: Alignment.center,
                  child: const Text(
                    'MM',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Name
          const Text(
            '👋  Hi, I\'m Manabendra Mondal',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 18),
          // Animated typing roles
          const TypingText(roles: _kRoles),
          const SizedBox(height: 32),
          // Social badges
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: _kSocials
                .map(
                  (s) => SocialBadge(
                    label: s.label,
                    icon: s.icon,
                    url: s.url,
                    bgColor: s.bg,
                    textColor: s.textColor,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 56),
        ],
      ),
    );
  }
}
