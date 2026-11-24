import 'package:flutter/foundation.dart';
import '../../../training/presentation/providers/training_provider.dart';

class DashboardProvider extends ChangeNotifier {
  int _completedSessions = 0;
  int _totalScore = 0;

  int get completedSessions => _completedSessions;
  int get totalScore => _totalScore;

  void syncFrom(TrainingProvider training) {
    final changed = _completedSessions != training.completedSessions ||
        _totalScore != training.totalScore;
    _completedSessions = training.completedSessions;
    _totalScore = training.totalScore;
    if (changed) notifyListeners();
  }
}
