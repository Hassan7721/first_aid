import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/theme/app_theme.dart';
import 'features/chat/presentation/providers/chat_provider.dart';
import 'features/dashboard/presentation/providers/dashboard_provider.dart';
import 'features/library/presentation/providers/library_provider.dart';
import 'features/profile/presentation/providers/profile_provider.dart';
import 'features/training/presentation/providers/training_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => LibraryProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => TrainingProvider()),
        ChangeNotifierProxyProvider<TrainingProvider, DashboardProvider>(
          create: (_) => DashboardProvider(),
          update: (_, training, dashboard) =>
              dashboard!..syncFrom(training),
        ),
      ],
      child: const FirstAidApp(),
    ),
  );
}
