import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/launcher.dart';

/// Coloured pill badge that links to a URL.
class SocialBadge extends StatefulWidget {
  const SocialBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.url,
    required this.bgColor,
    this.textColor = Colors.white,
  });

  final String label;
  final IconData icon;
  final String url;
  final Color bgColor;
  final Color textColor;

  @override
  State<SocialBadge> createState() => _SocialBadgeState();
}

class _SocialBadgeState extends State<SocialBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launch(widget.url),
        child: AnimatedScale(
          scale: _hovered ? 1.07 : 1.0,
          duration: const Duration(milliseconds: 180),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: _hovered
                  ? [BoxShadow(color: widget.bgColor.withAlpha(100), blurRadius: 14)]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, color: widget.textColor, size: 14),
                const SizedBox(width: 6),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Small action button used inside project/profile cards.
class SmallButton extends StatefulWidget {
  const SmallButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.filled = false,
    this.color = AppColors.accent,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;
  final Color color;

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.filled
                ? widget.color
                : (_hovered ? widget.color.withAlpha(40) : AppColors.surface2),
            borderRadius: BorderRadius.circular(8),
            border: widget.filled ? null : Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: widget.filled ? Colors.white : AppColors.textSecondary,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.filled ? Colors.white : AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
