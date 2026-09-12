import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/common.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('🛠️  Tech Stack'),
          const SizedBox(height: 20),
          ..._categories.map(
            (cat) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.title,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        cat.badges.map((b) => _TechBadge(b)).toList(),
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

class _BadgeData {
  final String label;
  final Color color;
  const _BadgeData(this.label, this.color);
}

class _Category {
  final String title;
  final List<_BadgeData> badges;
  const _Category(this.title, this.badges);
}

const _categories = [
  _Category('💻  LANGUAGES', [
    _BadgeData('C++',    Color(0xFF00599C)),
    _BadgeData('C',      Color(0xFF00599C)),
    _BadgeData('Python', Color(0xFF3776AB)),
    _BadgeData('Java',   Color(0xFFED8B00)),
    _BadgeData('Dart',   Color(0xFF0175C2)),
  ]),
  _Category('📱  MOBILE', [
    _BadgeData('Flutter',  Color(0xFF02569B)),
    _BadgeData('Android',  Color(0xFF3DDC84)),
    _BadgeData('iOS',      Color(0xFF333333)),
    _BadgeData('Riverpod', Color(0xFF0175C2)),
  ]),
  _Category('⚙️  BACKEND & APIs', [
    _BadgeData('Node.js',    Color(0xFF339933)),
    _BadgeData('Express.js', Color(0xFF404040)),
    _BadgeData('Socket.IO',  Color(0xFF010101)),
    _BadgeData('REST API',   Color(0xFF0055DA)),
    _BadgeData('JWT',        Color(0xFF333333)),
  ]),
  _Category('🗄️  DATABASES', [
    _BadgeData('MongoDB',    Color(0xFF47A248)),
    _BadgeData('MySQL',      Color(0xFF4479A1)),
    _BadgeData('PostgreSQL', Color(0xFF4169E1)),
    _BadgeData('SQLite',     Color(0xFF003B57)),
  ]),
  _Category('🤖  AI / ML  *(Learning)*', [
    _BadgeData('Machine Learning', Color(0xFFFF6F00)),
    _BadgeData('Deep Learning',    Color(0xFFEE4C2C)),
    _BadgeData('Generative AI',    Color(0xFF8E44AD)),
    _BadgeData('LLMs',             Color(0xFF10A37F)),
    _BadgeData('Transformers',     Color(0xFFD4A800)),
    _BadgeData('LangChain',        Color(0xFF1C3C3C)),
    _BadgeData('TensorFlow',       Color(0xFFFF6F00)),
    _BadgeData('PyTorch',          Color(0xFFEE4C2C)),
    _BadgeData('HuggingFace',      Color(0xFFD4A800)),
  ]),
  _Category('☁️  CLOUD & DEVOPS', [
    _BadgeData('AWS',    Color(0xFF232F3E)),
    _BadgeData('Docker', Color(0xFF2496ED)),
    _BadgeData('Linux',  Color(0xFF4A4A4A)),
    _BadgeData('Git',    Color(0xFFF05032)),
    _BadgeData('GitHub', Color(0xFF181717)),
  ]),
];

class _TechBadge extends StatefulWidget {
  const _TechBadge(this.badge);
  final _BadgeData badge;

  @override
  State<_TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<_TechBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.06 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.badge.color,
            borderRadius: BorderRadius.circular(6),
            boxShadow: _hovered
                ? [BoxShadow(color: widget.badge.color.withAlpha(80), blurRadius: 10)]
                : [],
          ),
          child: Text(
            widget.badge.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
