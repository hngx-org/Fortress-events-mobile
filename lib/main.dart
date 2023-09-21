import 'package:event_app/src/general_widgets/custom_nav_bar.dart';
import 'package:event_app/src/general_widgets/general_widgets_exports.dart';
import 'package:event_app/src/features/events/presentation/pages/create_event.dart';
import 'package:event_app/src/features/groups/pages/create_group.dart';
import 'package:flutter/material.dart';
import 'src/core/constants/strings.dart';
import 'src/core/utils/theme/theme_helper.dart';
import 'src/features/calendar/pages/calendar_screen.dart';
import 'src/features/start_up/pages/example_screen.dart';
// import 'src/features/start_up/pages/example_screen.dart';


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
      home: const BottomNavigationButton(),
    );
  }
}
