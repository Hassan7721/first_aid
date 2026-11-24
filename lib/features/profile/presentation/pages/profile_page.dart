import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/page_header.dart';
import '../../../../core/widgets/prototype_notice.dart';
import '../providers/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileProvider>();
    _nameController = TextEditingController(text: profile.name);
    _contactController =
        TextEditingController(text: profile.emergencyContactName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>();
    if (_nameController.text != profile.name) {
      _nameController.value = TextEditingValue(
        text: profile.name,
        selection: TextSelection.collapsed(offset: profile.name.length),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        const PageHeader(
          title: 'My Profile',
          subtitle: 'Manage your profile and emergency information.',
        ),
        Center(
          child: CircleAvatar(
            radius: 42,
            backgroundColor: AppColors.chatBlue,
            child: const Icon(Icons.person,
                size: 46, color: AppColors.promptWine),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _nameController,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Your name',
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
        const SizedBox(height: 12),
        // TextField(
        //   controller: _contactController,
        //   decoration: const InputDecoration(
        //     labelText: 'Emergency contact name',
        //     prefixIcon: Icon(Icons.contact_phone_outlined),
        //   ),
        // ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.softRed,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            children: [
              Icon(Icons.local_hospital_outlined,
                  color: AppColors.promptWine, size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ambulance emergency number (Egypt)',
                        style: TextStyle(
                            color: AppColors.promptWine,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 4),
                    Text('123',
                        style: TextStyle(
                            color: AppColors.promptWine,
                            fontSize: 23,
                            fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.promptWine,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () async {
            await context.read<ProfileProvider>().updateProfile(
                  name: _nameController.text,
                  contactName: _contactController.text,
                );
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully')),
            );
          },
          icon: const Icon(Icons.save_outlined),
          label: const Text('Save profile'),
        ),
        const SizedBox(height: 14),
        Text(
          'Current profile: ${profile.name}',
          style: const TextStyle(color: AppColors.muted),
        ),
        const SizedBox(height: 14),
        const PrototypeNotice(),
        const SizedBox(height: 10),
        const Text(
          'Your name is saved on this device. The emergency number shown is 123 for ambulance services in Egypt.',
          style: TextStyle(color: AppColors.muted, fontSize: 11, height: 1.4),
        ),
      ],
    );
  }
}
