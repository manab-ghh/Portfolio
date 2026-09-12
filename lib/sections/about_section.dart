import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('🧑‍💻  About Me'),
          const SizedBox(height: 20),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'I\'m a Computer Science Engineering student with a strong foundation in DSA, '
                  'competitive programming, and cross-platform mobile development — currently '
                  'deepening my backend engineering skills and actively exploring the AI/ML landscape.',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 24),
                ..._rows.map((r) => _AboutRow(r[0], r[1], r[2])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const _rows = [
  ['🎓', 'CS Engineering student',      'core fundamentals, algorithms, systems'],
  ['🧩', 'DSA & Competitive Programming','C++, Codeforces, LeetCode'],
  ['📱', 'Flutter / Dart',              'production-ready cross-platform mobile apps'],
  ['⚙️', 'Backend Engineering',          'Node.js, Express.js, REST APIs, Socket.IO'],
  ['🗄️', 'Databases',                    'MongoDB, MySQL, PostgreSQL, SQLite'],
  ['☁️', 'Cloud & DevOps',               'learning Docker, AWS, Linux workflows'],
  ['🤖', 'AI / ML',                      'exploring Machine Learning, Deep Learning, GenAI'],
  ['🧠', 'LLMs & Transformers',          'model architectures, fine-tuning, NLP'],
  ['🕸️', 'Agentic AI',                   'LangChain, AI Agents, RAG systems'],
  ['🚀', 'Vision',                       'intelligent, scalable software at backend + AI intersection'],
];

class _AboutRow extends StatelessWidget {
  const _AboutRow(this.emoji, this.label, this.desc);
  final String emoji, label, desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: '$label  ',
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '— $desc'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
