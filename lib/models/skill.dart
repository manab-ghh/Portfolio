import 'package:flutter/material.dart';

class SkillItem {
  final String name;
  final dynamic icon;
  final String? category;
  final Color? color;

  const SkillItem({
    required this.name,
    this.icon,
    this.category,
    this.color,
  });
}

class SkillCategory {
  final String title;
  final String subtitle;
  final dynamic icon;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.skills,
  });
}
