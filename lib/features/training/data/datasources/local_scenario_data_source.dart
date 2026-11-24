import '../models/training_scenario.dart';

class LocalScenarioDataSource {
  const LocalScenarioDataSource();

  List<TrainingScenario> getScenarios() => const [
        TrainingScenario(
          title: 'A person has a minor thermal burn',
          description: 'They have moved away from the hot object and are alert. What is the recommended first response?',
          options: [
            'Apply ice directly',
            'Cool under cool running water',
            'Put butter on the area',
            'Cover with cotton wool',
          ],
          correctIndex: 1,
          explanation: 'Cool running water is recommended for 20 minutes. Avoid ice, butter and creams.',
        ),
        TrainingScenario(
          title: 'Someone has severe bleeding',
          description: 'A person has a heavily bleeding wound. What should happen?',
          options: [
            'Wait to see if it stops',
            'Call emergency services and apply firm direct pressure if safe',
            'Wash for several minutes first',
            'Give them a drink',
          ],
          correctIndex: 1,
          explanation: 'Severe bleeding is an emergency. Get emergency help and apply firm direct pressure if safe.',
        ),
        TrainingScenario(
          title: 'A person is unresponsive',
          description: 'You find someone unresponsive. What is the safest next step?',
          options: [
            'Give them food',
            'Leave them alone',
            'Check response and breathing, call emergency services',
            'Ask them to stand',
          ],
          correctIndex: 2,
          explanation: 'Check responsiveness and normal breathing, call emergency services and follow dispatcher instructions.',
        ),
      ];
}
