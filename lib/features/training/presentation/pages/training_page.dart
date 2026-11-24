import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/page_header.dart';
import '../providers/training_provider.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TrainingProvider>();
    final scenario = provider.currentScenario;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        const PageHeader(
          title: 'Training Center',
          subtitle: 'Practice decision-making with educational scenarios.',
        ),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.promptWine,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SCENARIO SIMULATOR',
                style: TextStyle(
                  color: AppColors.chatBlue,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Scenario ${provider.currentIndex + 1} of ${provider.scenarios.length}',
                style: const TextStyle(color: AppColors.background),
              ),
              const SizedBox(height: 9),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (provider.currentIndex + 1) /
                      provider.scenarios.length,
                  minHeight: 7,
                  backgroundColor: Colors.white24,
                  color: AppColors.chatBlue,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                scenario.title,
                style: const TextStyle(
                  color: AppColors.background,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                scenario.description,
                style: const TextStyle(
                  color: AppColors.background,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Choose the best response',
          style: TextStyle(
            color: AppColors.promptWine,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(scenario.options.length, (index) {
          final isCorrectOption = index == scenario.correctIndex;
          final isSelected = index == provider.selectedAnswer;
          Color tileColor = AppColors.card;
          if (provider.hasCheckedAnswer && isCorrectOption) {
            tileColor = AppColors.softGreen;
          } else if (isSelected) {
            tileColor = AppColors.softBlue;
          }

          return Card(
            color: tileColor,
            child: RadioListTile<int>(
              value: index,
              groupValue: provider.selectedAnswer,
              onChanged: provider.hasCheckedAnswer
                  ? null
                  : (value) {
                      if (value != null) {
                        context.read<TrainingProvider>().selectAnswer(value);
                      }
                    },
              activeColor: AppColors.promptWine,
              title: Text(scenario.options[index]),
            ),
          );
        }),
        if (provider.hasCheckedAnswer) ...[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: provider.isCorrect
                  ? AppColors.softGreen
                  : AppColors.softRed,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.isCorrect ? 'Correct answer!' : 'Learning moment',
                  style: const TextStyle(
                    color: AppColors.promptWine,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(scenario.explanation),
              ],
            ),
          ),
        ],
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.promptWine,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: provider.selectedAnswer == null
                ? null
                : () {
                    if (!provider.hasCheckedAnswer) {
                      context.read<TrainingProvider>().checkAnswer();
                    } else {
                      final earned = context
                          .read<TrainingProvider>()
                          .finishOrContinue();
                      if (earned >= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Training completed! You earned $earned points.',
                            ),
                          ),
                        );
                      }
                    }
                  },
            child: Text(
              provider.hasCheckedAnswer
                  ? (provider.isLastScenario
                      ? 'Finish training'
                      : 'Next scenario')
                  : 'Check answer',
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Completed sessions: ${provider.completedSessions}   •   Points: ${provider.totalScore}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.muted, fontSize: 12),
        ),
      ],
    );
  }
}
