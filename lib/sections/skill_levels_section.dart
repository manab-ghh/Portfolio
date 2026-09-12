import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';
import '../widgets/skill_bar.dart';

class SkillLevelsSection extends StatelessWidget {
  const SkillLevelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('📊  Skill Levels'),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (_, c) {
              final wide = c.maxWidth > 700;
              return wide ? _WideLayout() : _NarrowLayout();
            },
          ),
        ],
      ),
    );
  }
}

class _WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _ProgrammingCard()),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [_DatabaseCard(), const SizedBox(height: 16), _AiCard()],
          ),
        ),
      ],
    );
  }
}

class _NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProgrammingCard(),
        const SizedBox(height: 16),
        _DatabaseCard(),
        const SizedBox(height: 16),
        _AiCard(),
      ],
    );
  }
}

class _ProgrammingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💻  Programming & Frameworks',
            style: TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          ..._programmingSkills.map(
            (s) => SkillBar(label: s.$1, value: s.$2, color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}

class _DatabaseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🗄️  Databases',
            style: TextStyle(
              color: AppColors.accentGreen,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          ..._dbSkills.map(
            (s) =>
                SkillBar(label: s.$1, value: s.$2, color: AppColors.accentGreen),
          ),
        ],
      ),
    );
  }
}

class _AiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🤖  AI / ML — Active Learning',
            style: TextStyle(
              color: AppColors.accentPurple,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          ..._aiSkills.map(
            (s) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Text('🟡 ', style: TextStyle(fontSize: 12)),
                  Expanded(
                    child: Text(
                      s.$1,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.accentPurple.withAlpha(40),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      s.$2,
                      style: const TextStyle(
                        color: AppColors.accentPurple,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
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

final _programmingSkills = <(String, double)>[
  ('C++',        0.90),
  ('C',          0.80),
  ('Python',     0.80),
  ('Dart',       0.80),
  ('Flutter',    0.80),
  ('Java',       0.70),
  ('Node.js',    0.65),
  ('Express.js', 0.65),
  ('Socket.IO',  0.60),
];

final _dbSkills = <(String, double)>[
  ('MongoDB',    0.70),
  ('MySQL',      0.70),
  ('SQLite',     0.70),
  ('PostgreSQL', 0.60),
];

const _aiSkills = [
  ('Machine Learning',       'Learning'),
  ('Deep Learning',          'Learning'),
  ('Generative AI',          'Learning'),
  ('LLMs & Transformers',    'Learning'),
  ('LangChain',              'Learning'),
  ('NLP & Computer Vision',  'Learning'),
  ('AI Agents & Agentic AI', 'Exploring'),
];
