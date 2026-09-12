import 'package:flutter/material.dart';
import '../core/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: const Column(
        children: [
          Text(
            '⚡  Build. Learn. Solve. Repeat.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
          SizedBox(height: 8),
          Text(
            '© 2025 Manabendra Mondal — Made with Flutter 💙',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
