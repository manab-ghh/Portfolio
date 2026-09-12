import 'dart:async';
import 'package:flutter/material.dart';
import '../core/colors.dart';

/// Cycles through [roles], typing and deleting each one.
class TypingText extends StatefulWidget {
  const TypingText({super.key, required this.roles});
  final List<String> roles;

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int _roleIndex = 0;
  int _charCount = 0;
  bool _deleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNext();
  }

  void _scheduleNext() {
    _timer = Timer.periodic(const Duration(milliseconds: 80), (_) {
      if (!mounted) return;
      setState(() {
        final role = widget.roles[_roleIndex];
        if (!_deleting) {
          if (_charCount < role.length) {
            _charCount++;
          } else {
            _deleting = true;
            _timer?.cancel();
            _timer = null;
            Future.delayed(const Duration(milliseconds: 1400), () {
              if (mounted) _scheduleNext();
            });
          }
        } else {
          if (_charCount > 0) {
            _charCount--;
          } else {
            _deleting = false;
            _roleIndex = (_roleIndex + 1) % widget.roles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.roles[_roleIndex].substring(0, _charCount);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.accent,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'monospace',
            ),
          ),
        ),
        const _BlinkingCursor(),
      ],
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  const _BlinkingCursor();

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Opacity(
        opacity: _ctrl.value > 0.5 ? 1 : 0,
        child: const Text(
          '|',
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
