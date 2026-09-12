import 'package:flutter/material.dart';
import 'theme.dart';
import '../screens/home_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manabendra Mondal — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: true,
      ),
      home: const HomeScreen(),
    );
  }
}
