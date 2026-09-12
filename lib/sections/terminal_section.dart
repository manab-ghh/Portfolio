import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';

class TerminalSection extends StatelessWidget {
  const TerminalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('🕹️  Developer Mode'),
          const SizedBox(height: 20),
          // bash block
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // macOS window dots
                Row(
                  children: [
                    _Dot(Colors.red.shade400),
                    const SizedBox(width: 6),
                    _Dot(Colors.orange.shade400),
                    const SizedBox(width: 6),
                    _Dot(Colors.green.shade400),
                    const SizedBox(width: 12),
                    const Text(
                      'bash — manab@dev',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                const Divider(color: AppColors.border, height: 24),
                ..._termLines.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          height: 1.7,
                        ),
                        children: [
                          TextSpan(
                            text: '\$ ${e[0]}',
                            style: const TextStyle(
                                color: AppColors.accentGreen),
                          ),
                          const TextSpan(
                            text: '  →  ',
                            style: TextStyle(color: AppColors.textMuted),
                          ),
                          TextSpan(
                            text: e[1],
                            style: const TextStyle(
                                color: AppColors.textPrimary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // ASCII art box
          GlassCard(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText(
                _asciiBox,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: AppColors.accent,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

const _termLines = [
  [r'whoami',             'Manabendra Mondal'],
  [r'role',               'CS Student · Backend Dev · Competitive Programmer · AI/ML Explorer'],
  [r'currently_building', 'Real-time apps · REST APIs · LLM workflows · C++ systems'],
  [r'currently_learning', 'Node.js · Docker · AWS · Deep Learning · LLMs · Agentic AI'],
  [r'goal',               'Build intelligent, scalable systems that solve real-world problems.'],
  [r'coffee',             '[██████████] 100%  (always)'],
];

const _asciiBox = '''
╔══════════════════════════════════════════════════════════════════╗
║                        MANABENDRA.DEV                            ║
╠══════════════════════════════════════════════════════════════════╣
║  Role       :  CS Engineering Student                            ║
║  Focus      :  Backend Engineering + Artificial Intelligence     ║
║  Languages  :  C++ · Python · Java · Dart · C                    ║
║  Frameworks :  Flutter · Node.js · Express.js · Socket.IO        ║
║  Databases  :  MongoDB · MySQL · PostgreSQL · SQLite             ║
║  Cloud/Ops  :  AWS · Docker · Linux · Git                        ║
║  AI / ML    :  ML · DL · GenAI · LLMs · Transformers · Agents    ║
║  Status     :  Continuously Learning & Building  🚀              ║
╚══════════════════════════════════════════════════════════════════╝''';
