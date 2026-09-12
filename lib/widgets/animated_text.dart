import 'dart:async';
import 'package:flutter/material.dart';
import '../app/theme.dart';

class TypewriterAnimatedText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration pauseDuration;
  final Duration deletingSpeed;

  const TypewriterAnimatedText({
    super.key,
    required this.texts,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 70),
    this.pauseDuration = const Duration(milliseconds: 1800),
    this.deletingSpeed = const Duration(milliseconds: 35),
  });

  @override
  State<TypewriterAnimatedText> createState() => _TypewriterAnimatedTextState();
}

class _TypewriterAnimatedTextState extends State<TypewriterAnimatedText> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;
  bool _showCursor = true;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _startCursorBlink();
    _scheduleNext();
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 530), (_) {
      if (mounted) {
        setState(() => _showCursor = !_showCursor);
      }
    });
  }

  void _scheduleNext() {
    if (widget.texts.isEmpty) return;

    final currentFullText = widget.texts[_textIndex];

    if (!_isDeleting) {
      if (_charIndex < currentFullText.length) {
        _timer = Timer(widget.typingSpeed, () {
          if (mounted) {
            setState(() => _charIndex++);
            _scheduleNext();
          }
        });
      } else {
        // Paused at full text before deleting
        _timer = Timer(widget.pauseDuration, () {
          if (mounted) {
            setState(() => _isDeleting = true);
            _scheduleNext();
          }
        });
      }
    } else {
      if (_charIndex > 0) {
        _timer = Timer(widget.deletingSpeed, () {
          if (mounted) {
            setState(() => _charIndex--);
            _scheduleNext();
          }
        });
      } else {
        // Done deleting, go to next string
        setState(() {
          _isDeleting = false;
          _textIndex = (_textIndex + 1) % widget.texts.length;
        });
        _timer = Timer(const Duration(milliseconds: 350), () {
          if (mounted) _scheduleNext();
        });
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentFullText = widget.texts.isNotEmpty ? widget.texts[_textIndex] : '';
    final visibleText = currentFullText.substring(0, _charIndex.clamp(0, currentFullText.length));

    final baseStyle = widget.style ??
        const TextStyle(
          fontFamily: 'Fira Code',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.cyan,
        );

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: visibleText, style: baseStyle),
          TextSpan(
            text: '|',
            style: baseStyle.copyWith(
              color: _showCursor ? AppColors.primary : Colors.transparent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
