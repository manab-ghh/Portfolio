import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/launcher.dart';
import '../widgets/common.dart';
import '../widgets/wrap_grid.dart';

class ProfilesSection extends StatelessWidget {
  const ProfilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('🏅  Coding Profiles'),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (_, c) => WrapGrid(
              cols: c.maxWidth > 700 ? 2 : 1,
              spacing: 16,
              children: _profiles
                  .map((p) => _ProfileCard(p))
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          const SectionTitle('⚔️  Competitive Programming'),
          const SizedBox(height: 20),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CompRow('🔵', 'Codeforces', '@manab.code',
                    AppColors.accent, 'https://codeforces.com/profile/manab.code'),
                const Divider(color: AppColors.border, height: 28),
                _CompRow('🟡', 'LeetCode', '@manab__344',
                    const Color(0xFFFFA116), 'https://www.leetcode.com/manab__344'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileData {
  final String emoji, platform, handle, stat;
  final String url;
  final Color color;
  const _ProfileData(this.emoji, this.platform, this.handle, this.stat, this.url, this.color);
}

const _profiles = [
  _ProfileData('⭐', 'GitHub',     '@manab-ghh',   'Active contributor',  'https://github.com/manab-ghh',                                  Color(0xFF181717)),
  _ProfileData('🔵', 'Codeforces', '@manab.code',  'Competitive Programmer','https://codeforces.com/profile/manab.code',                    Color(0xFF1F8ACB)),
  _ProfileData('🟡', 'LeetCode',   '@manab__344',  'Problem Solver',       'https://www.leetcode.com/manab__344',                          Color(0xFFFFA116)),
  _ProfileData('📊', 'Kaggle',     '@manabendramondal', 'ML Explorer',    'https://kaggle.com/manabendramondal',                           Color(0xFF20BEFF)),
];

class _ProfileCard extends StatefulWidget {
  const _ProfileCard(this.data);
  final _ProfileData data;

  @override
  State<_ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<_ProfileCard> {
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered ? d.color : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: d.color.withAlpha(40),
                  shape: BoxShape.circle,
                  border: Border.all(color: d.color),
                ),
                alignment: Alignment.center,
                child: Text(d.emoji,
                    style: const TextStyle(fontSize: 20)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d.platform,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Text(d.handle,
                        style: TextStyle(color: d.color, fontSize: 13)),
                    Text(d.stat,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Icon(Icons.open_in_new,
                  color: AppColors.textMuted, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompRow extends StatelessWidget {
  const _CompRow(this.dot, this.name, this.handle, this.color, this.url);
  final String dot, name, handle, url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(dot, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              Text(handle,
                  style: TextStyle(color: color, fontSize: 13)),
              const SizedBox(height: 2),
              Text(
                'Solving algorithmic challenges & competitive programming problems.',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => launch(url),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: color.withAlpha(40),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color),
            ),
            child: Text(
              'View Profile →',
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
