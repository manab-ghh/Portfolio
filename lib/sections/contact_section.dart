import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/launcher.dart';
import '../widgets/common.dart';
import '../widgets/wrap_grid.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('📬  Get In Touch'),
          const SizedBox(height: 8),
          const Text(
            'Feel free to reach out — whether it\'s collaboration, opportunities, or just a hello! 🚀',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (_, c) => WrapGrid(
              cols: c.maxWidth > 700 ? 2 : 1,
              spacing: 12,
              children: _contacts.map((c) => _ContactCard(c)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactData {
  final IconData icon;
  final String platform, handle, url;
  final Color color;
  const _ContactData(this.icon, this.platform, this.handle, this.url, this.color);
}

const _contacts = [
  _ContactData(Icons.email,     'Email',     'manabendra2006mondal@gmail.com',    'mailto:manabendra2006mondal@gmail.com',                     Color(0xFFEA4335)),
  _ContactData(Icons.work,      'LinkedIn',  'manabendra-mondal-22254434a',       'https://www.linkedin.com/in/manabendra-mondal-22254434a',    Color(0xFF0A66C2)),
  _ContactData(Icons.code,      'GitHub',    '@manab-ghh',                        'https://github.com/manab-ghh',                              Color(0xFF181717)),
  _ContactData(Icons.close,     'Twitter/X', '@manabendra87314',                  'https://twitter.com/@manabendra87314',                       Colors.black),
  _ContactData(Icons.leaderboard,'Codeforces','manab.code',                       'https://codeforces.com/profile/manab.code',                  Color(0xFF1F8ACB)),
  _ContactData(Icons.psychology, 'LeetCode', 'manab__344',                        'https://www.leetcode.com/manab__344',                        Color(0xFFFFA116)),
  _ContactData(Icons.science,   'Kaggle',    'manabendramondal',                  'https://kaggle.com/manabendramondal',                        Color(0xFF20BEFF)),
  _ContactData(Icons.language,  'Portfolio', 'portfolio-37689.web.app',           'https://portfolio-37689.web.app',                           Color(0xFFFF5722)),
];

class _ContactCard extends StatefulWidget {
  const _ContactCard(this.data);
  final _ContactData data;

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launch(d.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? d.color : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: d.color.withAlpha(40),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(d.icon, color: d.color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d.platform,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    Text(d.handle,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  color: AppColors.textMuted, size: 12),
            ],
          ),
        ),
      ),
    );
  }
}
