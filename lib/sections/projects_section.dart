import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/launcher.dart';
import '../widgets/common.dart';
import '../widgets/wrap_grid.dart';
import '../widgets/buttons.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('🚀  Featured Projects'),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (_, c) => WrapGrid(
              cols: c.maxWidth > 700 ? 2 : 1,
              spacing: 16,
              children: _projects.map((p) => _ProjectCard(p)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectData {
  final String emoji, title, subtitle, description;
  final List<String> highlights, stack;
  final String? githubUrl, liveUrl;
  const _ProjectData({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.highlights,
    required this.stack,
    this.githubUrl,
    this.liveUrl,
  });
}

const _projects = [
  _ProjectData(
    emoji: '💬',
    title: 'ChatApp',
    subtitle: 'Real-time Chat Application',
    description:
        'A full-stack real-time chat application with group/private messaging, '
        'live user presence indicators, and JWT-based authentication.',
    highlights: [
      'Real-time messaging via Socket.IO',
      'JWT authentication & bcrypt hashing',
      'MongoDB for message persistence',
      'Group chats + private messaging',
      'Live online/offline presence',
    ],
    stack: ['Node.js', 'Express', 'Socket.IO', 'MongoDB', 'JWT'],
    githubUrl: 'https://github.com/manab-ghh/ChatApp',
  ),
  _ProjectData(
    emoji: '📚',
    title: 'C++ Course',
    subtitle: 'Structured C++ Learning Path',
    description:
        'A complete, beginner-friendly C++ course covering fundamentals to advanced '
        'OOP, STL, algorithms, and problem-solving patterns.',
    highlights: [
      'Fundamentals → Advanced OOP & Templates',
      'Full STL coverage: vectors, maps, sets',
      'Algorithmic thinking & competitive patterns',
      'Real interview & contest-style problems',
    ],
    stack: ['C++', 'STL', 'OOP', 'DSA'],
    githubUrl: 'https://github.com/manab-ghh/CPP-Course',
  ),
  _ProjectData(
    emoji: '🌐',
    title: 'Portfolio',
    subtitle: 'Flutter Web Portfolio',
    description:
        'This very portfolio — built with Flutter Web featuring a dark glassmorphism '
        'aesthetic, animated typing text, and embedded GitHub stats.',
    highlights: [
      'Flutter Web with custom dark theme',
      'Animated typing text & micro-interactions',
      'Embedded GitHub stats & snake animation',
      'Responsive for desktop & mobile',
    ],
    stack: ['Flutter', 'Dart', 'Firebase Hosting'],
    githubUrl: 'https://github.com/manab-ghh',
    liveUrl: 'https://portfolio-37689.web.app',
  ),
  _ProjectData(
    emoji: '🧠',
    title: 'AI / ML Projects',
    subtitle: 'Machine Learning Experiments',
    description:
        'Exploring ML/DL with hands-on projects ranging from classical algorithms '
        'to LLM integrations, RAG pipelines, and agentic AI systems.',
    highlights: [
      'Classical ML: regression, classification, clustering',
      'DL with PyTorch & TensorFlow',
      'LangChain RAG & AI agent experiments',
      'GenAI: LLM API integration & prompting',
    ],
    stack: ['Python', 'PyTorch', 'LangChain', 'HuggingFace'],
    githubUrl: 'https://github.com/manab-ghh',
  ),
];

class _ProjectCard extends StatefulWidget {
  const _ProjectCard(this.data);
  final _ProjectData data;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withAlpha(30),
                    blurRadius: 20,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.data.emoji,
                    style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.data.subtitle,
                        style: const TextStyle(
                          color: AppColors.accent,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.data.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 12),
            ...widget.data.highlights.map(
              (h) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('✨ ',
                        style: TextStyle(fontSize: 11)),
                    Expanded(
                      child: Text(
                        h,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.data.stack
                  .map(
                    (s) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surface2,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        s,
                        style: const TextStyle(
                          color: AppColors.accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (widget.data.githubUrl != null)
                  SmallButton(
                    icon: Icons.code,
                    label: 'Source',
                    onTap: () => launch(widget.data.githubUrl!),
                  ),
                if (widget.data.liveUrl != null)
                  SmallButton(
                    icon: Icons.open_in_new,
                    label: 'Live Demo',
                    onTap: () => launch(widget.data.liveUrl!),
                    filled: true,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
