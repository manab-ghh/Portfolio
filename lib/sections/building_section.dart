import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';
import '../widgets/wrap_grid.dart';

class BuildingSection extends StatelessWidget {
  const BuildingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('🔥  What I\'m Building & Learning'),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (ctx, c) => WrapGrid(
              cols: c.maxWidth > 700 ? 2 : 1,
              spacing: 16,
              children: const [
                _BuildCard(
                  icon: '⚙️',
                  title: 'Backend Engineering',
                  color: AppColors.accentGreen,
                  items: [
                    'Node.js & Express.js — REST APIs, middleware, auth',
                    'Socket.IO — real-time bidirectional communication',
                    'MongoDB, MySQL, PostgreSQL, SQLite — schema design',
                    'JWT & bcrypt — secure authentication systems',
                    'Modular Architecture — scalable backend design',
                  ],
                ),
                _BuildCard(
                  icon: '🤖',
                  title: 'AI / ML & Intelligent Systems',
                  color: AppColors.accentPurple,
                  items: [
                    'Core ML & DL — algorithms, neural networks, PyTorch',
                    'Generative AI — LLMs, prompt engineering, embeddings',
                    'LangChain & AI Agents — tool use, chain orchestration',
                    'NLP — text processing, sequence modeling, Transformers',
                    'Computer Vision — image classification & visual analysis',
                  ],
                ),
                _BuildCard(
                  icon: '🧩',
                  title: 'Algorithms & Problem Solving',
                  color: AppColors.accent,
                  items: [
                    'Data Structures — Trees, Graphs, Heaps, Segment Trees',
                    'Competitive Programming — C++, STL, Codeforces, LeetCode',
                    'System Design Fundamentals — OOP, SOLID, component design',
                    'Dynamic Programming — classical & advanced patterns',
                  ],
                ),
                _BuildCard(
                  icon: '☁️',
                  title: 'Cloud & Infrastructure',
                  color: AppColors.accentOrange,
                  items: [
                    'Docker — containerizing applications & environments',
                    'AWS — EC2, S3, IAM, cloud fundamentals',
                    'Linux — development workflows, scripting, system mgmt',
                    'Git & GitHub — version control, CI workflows',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildCard extends StatelessWidget {
  const _BuildCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.items,
  });

  final String icon, title;
  final Color color;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('▸ ', style: TextStyle(color: color, fontSize: 12)),
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
