class AchievementItem {
  final String title;
  final String organizer;
  final String date;
  final String badge;
  final String description;
  final String? credentialUrl;

  const AchievementItem({
    required this.title,
    required this.organizer,
    required this.date,
    required this.badge,
    required this.description,
    this.credentialUrl,
  });
}
