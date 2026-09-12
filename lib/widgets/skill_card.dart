import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../models/skill.dart';
import 'app_icon.dart';

class SkillCard extends StatefulWidget {
  final SkillItem skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = widget.skill.color ?? AppColors.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.surfaceLight
              : AppColors.surfaceElevated.withValues(alpha: 0.7),
          borderRadius: AppRadius.radiusMd,
          border: Border.all(
            color: _isHovered
                ? accentColor.withValues(alpha: 0.5)
                : AppColors.borderSubtle,
            width: 1.2,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: accentColor.withValues(alpha: 0.15),
                blurRadius: 16,
                offset: const Offset(0, 4),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.skill.icon != null) ...[
              AnimatedScale(
                scale: _isHovered ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: AppIcon(
                  widget.skill.icon,
                  size: 16,
                  color: _isHovered ? accentColor : AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(
              widget.skill.name,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _isHovered ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
