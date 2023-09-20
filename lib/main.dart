import 'package:flutter/material.dart';
import 'src/core/constants/strings.dart';
import 'src/core/utils/theme/theme_helper.dart';
import 'src/features/start_up/pages/homepage_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      //TODO: Handle the app theming
      theme: theme,
      //TODO: Handle the app navigation
      // routes:
      home: const ExampleScreen(),
    );
  }
}
