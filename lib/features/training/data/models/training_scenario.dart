class TrainingScenario {
  const TrainingScenario({
    required this.title,
    required this.description,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  final String title;
  final String description;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}
