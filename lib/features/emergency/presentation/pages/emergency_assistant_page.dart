import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../library/data/models/first_aid_guide.dart';
import '../../../library/presentation/providers/library_provider.dart';
import '../../../library/presentation/pages/guide_details_page.dart';

class EmergencyAssistantPage extends StatefulWidget {
  const EmergencyAssistantPage({super.key});

  @override
  State<EmergencyAssistantPage> createState() =>
      _EmergencyAssistantPageState();
}

class _EmergencyAssistantPageState extends State<EmergencyAssistantPage> {
  String? _selectedId;
  bool _isLifeThreatening = false;

  @override
  Widget build(BuildContext context) {
    final guides = context.watch<LibraryProvider>().guides;
    final matchingGuides =
        guides.where((guide) => guide.id == _selectedId).toList();
    final selected =
        matchingGuides.isEmpty ? null : matchingGuides.first;

    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Assistant')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.promptWine,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.health_and_safety, color: AppColors.chatBlue, size: 32),
                SizedBox(height: 10),
                Text(
                  'Let’s find the right guide',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Choose a topic to open educational guidance. If someone may be in immediate danger, contact emergency services now.',
                  style: TextStyle(color: AppColors.background, height: 1.45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'What happened?',
            style: TextStyle(
              color: AppColors.promptWine,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          ...guides.map(
            (guide) => Card(
              child: RadioListTile<String>(
                value: guide.id,
                groupValue: _selectedId,
                activeColor: AppColors.promptWine,
                onChanged: (value) => setState(() => _selectedId = value),
                title: Text('${guide.icon}  ${guide.title}'),
                subtitle: Text(guide.subtitle),
              ),
            ),
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.promptWine,
            value: _isLifeThreatening,
            onChanged: (value) =>
                setState(() => _isLifeThreatening = value ?? false),
            title: const Text(
              'This may be a life-threatening emergency',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: const Text(
              'For example: not breathing normally, unconscious, severe bleeding, or rapidly worsening symptoms.',
            ),
          ),
          if (_isLifeThreatening)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.softRed,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Contact your local emergency number immediately. Do not wait for this app or an AI response. Follow the dispatcher’s instructions.',
                style: TextStyle(
                  color: AppColors.promptWine,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          const SizedBox(height: 12),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.promptWine,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: selected == null
                ? null
                : () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GuideDetailsPage(guide: selected),
                      ),
                    ),
            child: const Text('View first aid guidance'),
          ),
        ],
      ),
    );
  }
}
