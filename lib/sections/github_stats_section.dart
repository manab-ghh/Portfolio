import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';

class GithubStatsSection extends StatelessWidget {
  const GithubStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('📈  GitHub Stats'),
          const SizedBox(height: 20),
          GlassCard(
            child: Column(
              children: [
                // GitHub Streak
                _NetImage(
                  'https://streak-stats.demolab.com/?user=manab-ghh'
                  '&theme=dark&background=161B22&border=30363D'
                  '&stroke=38BDF8&ring=38BDF8&currStreakLabel=38BDF8',
                  'GitHub Streak Stats',
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.border, height: 1),
                const SizedBox(height: 16),
                // Snake animation
                _NetImage(
                  'https://raw.githubusercontent.com/manab-ghh/manab-ghh/output/github-contribution-grid-snake-dark.svg',
                  'Contribution Snake',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NetImage extends StatelessWidget {
  const _NetImage(this.url, this.label);
  final String url, label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: double.infinity,
        fit: BoxFit.fitWidth,
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : Container(
                height: 120,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: AppColors.accent,
                  strokeWidth: 2,
                ),
              ),
        errorBuilder: (_, __, ___) => Container(
          height: 80,
          alignment: Alignment.center,
          child: Text(
            '⚡ $label — (loads on live site)',
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
