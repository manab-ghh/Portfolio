import 'package:flutter/material.dart';
import 'core/colors.dart';
import 'portfolio_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manabendra Mondal — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accentPurple,
          surface: AppColors.surface,
        ),
        dividerColor: AppColors.border,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.border),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}
