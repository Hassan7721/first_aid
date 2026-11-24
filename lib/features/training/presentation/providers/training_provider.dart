import 'package:flutter/foundation.dart';
import '../../data/datasources/local_scenario_data_source.dart';
import '../../data/models/training_scenario.dart';

class TrainingProvider extends ChangeNotifier {
  TrainingProvider() {
    _scenarios = const LocalScenarioDataSource().getScenarios();
  }

  late final List<TrainingScenario> _scenarios;
  int _currentIndex = 0;
  int? _selectedAnswer;
  bool _hasCheckedAnswer = false;
  int _completedSessions = 0;
  int _totalScore = 0;
  int _correctInCurrentSession = 0;

  List<TrainingScenario> get scenarios => List.unmodifiable(_scenarios);
  TrainingScenario get currentScenario => _scenarios[_currentIndex];
  int get currentIndex => _currentIndex;
  int? get selectedAnswer => _selectedAnswer;
  bool get hasCheckedAnswer => _hasCheckedAnswer;
  int get completedSessions => _completedSessions;
  int get totalScore => _totalScore;
  int get correctInCurrentSession => _correctInCurrentSession;
  bool get isLastScenario => _currentIndex == _scenarios.length - 1;
  bool get isCorrect =>
      _selectedAnswer == currentScenario.correctIndex;

  void selectAnswer(int index) {
    if (_hasCheckedAnswer) return;
    _selectedAnswer = index;
    notifyListeners();
  }

  void checkAnswer() {
    if (_selectedAnswer == null || _hasCheckedAnswer) return;
    _hasCheckedAnswer = true;
    if (isCorrect) _correctInCurrentSession++;
    notifyListeners();
  }

  int finishOrContinue() {
    if (!isLastScenario) {
      _currentIndex++;
      _selectedAnswer = null;
      _hasCheckedAnswer = false;
      notifyListeners();
      return -1;
    }

    final earnedPoints = _correctInCurrentSession * 10;
    _completedSessions++;
    _totalScore += earnedPoints;
    _currentIndex = 0;
    _selectedAnswer = null;
    _hasCheckedAnswer = false;
    _correctInCurrentSession = 0;
    notifyListeners();
    return earnedPoints;
  }

  void resetSession() {
    _currentIndex = 0;
    _selectedAnswer = null;
    _hasCheckedAnswer = false;
    _correctInCurrentSession = 0;
    notifyListeners();
  }
}
