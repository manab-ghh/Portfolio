class ProjectModel {
  final String title;
  final String repoName;
  final String description;
  final String category;
  final List<String> technologies;
  final List<String> highlights;
  final String githubUrl;
  final String? liveUrl;
  final bool isFeatured;
  final int stars;

  const ProjectModel({
    required this.title,
    required this.repoName,
    required this.description,
    required this.category,
    required this.technologies,
    required this.highlights,
    required this.githubUrl,
    this.liveUrl,
    this.isFeatured = false,
    this.stars = 0,
  });
}
