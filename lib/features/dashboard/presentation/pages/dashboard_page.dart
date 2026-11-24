import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../providers/dashboard_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboard = context.watch<DashboardProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Learning Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.promptWine,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'YOUR LEARNING JOURNEY',
                  style: TextStyle(
                    color: AppColors.chatBlue,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Keep learning. Be prepared.',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    _Stat(value: '${dashboard.completedSessions}', label: 'Sessions'),
                    const SizedBox(width: 10),
                    _Stat(value: '${dashboard.totalScore}', label: 'Points'),
                    const SizedBox(width: 10),
                    _Stat(
                      value: dashboard.completedSessions >= 3 ? 'Active' : 'Starter',
                      label: 'Level',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Achievements',
            style: TextStyle(
              color: AppColors.promptWine,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          _Achievement(
            title: 'First steps',
            description: 'Complete your first training session',
            unlocked: dashboard.completedSessions >= 1,
          ),
          _Achievement(
            title: 'Knowledge builder',
            description: 'Earn 20 learning points',
            unlocked: dashboard.totalScore >= 20,
          ),
          _Achievement(
            title: 'Practice champion',
            description: 'Complete 3 training sessions',
            unlocked: dashboard.completedSessions >= 3,
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: AppColors.background,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.background,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Achievement extends StatelessWidget {
  const _Achievement({
    required this.title,
    required this.description,
    required this.unlocked,
  });

  final String title;
  final String description;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              unlocked ? AppColors.chatBlue : const Color(0xFFE8E1D6),
          child: const Icon(Icons.emoji_events_outlined, color: AppColors.promptWine),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.promptWine,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(description),
        trailing: Icon(
          unlocked ? Icons.check_circle : Icons.lock_outline,
          color: unlocked ? Colors.green : AppColors.muted,
        ),
      ),
    );
  }
}
