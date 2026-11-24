import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/first_aid_guide.dart';

class GuideDetailsPage extends StatelessWidget {
  const GuideDetailsPage({required this.guide, super.key});

  final FirstAidGuide guide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Aid Guide')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.chatBlue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(guide.icon, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 8),
                Text(
                  guide.title,
                  style: const TextStyle(
                    color: AppColors.promptWine,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(guide.summary, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'What to do',
            style: TextStyle(
              color: AppColors.promptWine,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          ...guide.steps.asMap().entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.promptWine,
                      child: Text(
                        '${entry.key + 1}',
                        style: const TextStyle(color: AppColors.background),
                      ),
                    ),
                    title: Text(entry.value),
                  ),
                ),
              ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.softRed,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Important safety note',
                  style: TextStyle(
                    color: AppColors.promptWine,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(guide.warning),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
