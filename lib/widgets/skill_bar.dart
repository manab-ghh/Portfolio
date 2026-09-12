import 'package:flutter/material.dart';
import '../core/colors.dart';

/// Animated skill progress bar.
class SkillBar extends StatelessWidget {
  const SkillBar({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value; // 0.0 – 1.0
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                '${(value * 100).round()}%',
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 6,
              backgroundColor: AppColors.border,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
