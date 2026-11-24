class FirstAidGuide {
  const FirstAidGuide({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.category,
    required this.summary,
    required this.steps,
    required this.warning,
  });

  final String id;
  final String title;
  final String subtitle;
  final String icon;
  final String category;
  final String summary;
  final List<String> steps;
  final String warning;
}
