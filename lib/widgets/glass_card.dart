import 'package:flutter/material.dart';
import '../app/theme.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool enableHover;
  final Color? hoverBorderColor;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.enableHover = true,
    this.hoverBorderColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final br = widget.borderRadius ?? AppRadius.radiusLg;
    final bg = widget.backgroundColor ??
        (_isHovered && widget.enableHover
            ? AppColors.surfaceElevated
            : AppColors.surface.withValues(alpha: 0.85));

    final border = widget.borderColor ??
        (_isHovered && widget.enableHover
            ? (widget.hoverBorderColor ?? AppColors.primary.withValues(alpha: 0.5))
            : AppColors.borderSubtle);

    Widget card = AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding ?? const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: br,
        border: Border.all(
          color: border,
          width: _isHovered && widget.enableHover ? 1.5 : 1.0,
        ),
        boxShadow: [
          if (_isHovered && widget.enableHover)
            BoxShadow(
              color: (widget.hoverBorderColor ?? AppColors.primary).withValues(alpha: 0.15),
              blurRadius: 24,
              offset: const Offset(0, 8),
            )
          else
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: widget.child,
    );

    if (widget.onTap != null) {
      card = InkWell(
        onTap: widget.onTap,
        borderRadius: br,
        splashColor: AppColors.primary.withValues(alpha: 0.1),
        highlightColor: Colors.transparent,
        child: card,
      );
    }

    if (!widget.enableHover) return card;

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: card,
      ),
    );
  }
}
