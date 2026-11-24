import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/main_navigation_page.dart';
import 'features/onboarding/presentation/pages/welcome_page.dart';
import 'features/profile/presentation/providers/profile_provider.dart';

class FirstAidApp extends StatelessWidget {
  const FirstAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirstAid AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Consumer<ProfileProvider>(
        builder: (context, profile, _) {
          if (profile.isLoading) {
            return const Scaffold(
              backgroundColor: AppColors.background,
              body: Center(
                child: CircularProgressIndicator(color: AppColors.promptWine),
              ),
            );
          }
          return profile.hasName
              ? const MainNavigationPage()
              : const WelcomePage();
        },
      ),
    );
  }
}
