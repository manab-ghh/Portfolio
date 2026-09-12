import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('📌  2025 Learning Roadmap'),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (_, c) {
              final wide = c.maxWidth > 700;
              if (wide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _RoadCol('✅ Solid Foundation', AppColors.accentGreen, _familiar)),
                    const SizedBox(width: 16),
                    Expanded(child: _RoadCol('📖 Currently Learning', AppColors.accent, _learning)),
                    const SizedBox(width: 16),
                    Expanded(child: _RoadCol('🔭 Exploring Next', AppColors.accentOrange, _exploring)),
                  ],
                );
              }
              return Column(
                children: [
                  _RoadCol('✅ Solid Foundation',   AppColors.accentGreen,  _familiar),
                  const SizedBox(height: 16),
                  _RoadCol('📖 Currently Learning', AppColors.accent,       _learning),
                  const SizedBox(height: 16),
                  _RoadCol('🔭 Exploring Next',     AppColors.accentOrange, _exploring),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RoadCol extends StatelessWidget {
  const _RoadCol(this.title, this.color, this.items);
  final String title;
  final Color color;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )),
          const SizedBox(height: 14),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 6, right: 10),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _familiar = [
  'C++ & STL — core language',
  'Dart & Flutter — mobile/web',
  'Node.js & Express.js',
  'MongoDB & MySQL',
  'REST APIs & Socket.IO',
  'Git & Linux workflows',
];

const _learning = [
  'Advanced System Design',
  'Docker & Kubernetes',
  'AWS & cloud infra',
  'Deep Learning (DL)',
  'Transformers & LLMs',
  'LangChain & RAG',
];

const _exploring = [
  'Agentic AI & Multi-Agent',
  'MLOps & model deployment',
  'Computer Vision',
  'Reinforcement Learning',
  'Distributed Systems',
  'Open Source contribution',
];
