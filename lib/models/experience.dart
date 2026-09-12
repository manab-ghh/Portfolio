class ExperienceItem {
  final String role;
  final String organization;
  final String period;
  final String location;
  final String description;
  final List<String> keyPoints;
  final List<String> technologies;

  const ExperienceItem({
    required this.role,
    required this.organization,
    required this.period,
    required this.location,
    required this.description,
    required this.keyPoints,
    required this.technologies,
  });
}
