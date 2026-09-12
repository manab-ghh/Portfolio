import 'package:flutter/material.dart';
import '../core/colors.dart';

/// Constrains content to 1100 px max-width with horizontal padding.
class SectionWrap extends StatelessWidget {
  const SectionWrap({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: child,
        ),
      ),
    );
  }
}

/// Section heading with a gradient underline accent.
class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentPurple],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

/// Glassmorphism-style dark card.
class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}
