import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../utils/launcher.dart';
import 'app_icon.dart';

class SocialButton extends StatefulWidget {
  final dynamic icon;
  final String tooltip;
  final String url;
  final Color? color;
  final double size;

  const SocialButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.url,
    this.color,
    this.size = 42,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.color ?? AppColors.primary;

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => UrlHelper.launch(widget.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: _isHovered
                  ? activeColor.withValues(alpha: 0.18)
                  : AppColors.surfaceElevated.withValues(alpha: 0.8),
              borderRadius: AppRadius.radiusMd,
              border: Border.all(
                color: _isHovered
                    ? activeColor.withValues(alpha: 0.6)
                    : AppColors.borderSubtle,
                width: 1.2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: activeColor.withValues(alpha: 0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: AnimatedScale(
                scale: _isHovered ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: AppIcon(
                  widget.icon,
                  size: widget.size * 0.44,
                  color: _isHovered ? activeColor : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
