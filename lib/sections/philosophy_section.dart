import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('💭  Developer Philosophy'),
          const SizedBox(height: 20),
          ..._quotes.map(
            (q) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GlassCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.accent, AppColors.accentPurple],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        '"$q"',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _quotes = [
  'I believe in writing code that not only works but is readable, '
      'maintainable, and built for scale.',
  'Every complex problem is an opportunity to engineer something elegant '
      '— the gap between human intent and machine execution is where I thrive.',
  'The intersection of backend engineering and artificial intelligence '
      'is where the next generation of intelligent systems will be built.',
];
