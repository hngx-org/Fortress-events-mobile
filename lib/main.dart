
import 'package:event_app/src/features/start_up/pages/homepage_three.dart';
import 'package:event_app/src/features/start_up/pages/homepage_two.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'src/features/comment_section/notifications_two.dart';
import 'package:get/get.dart';
=======
import 'src/core/constants/strings.dart';
import 'src/core/utils/theme/theme_helper.dart';
import 'src/features/start_up/pages/homepage_one.dart';

import 'package:event_app/src/features/events/presentation/pages/create_event.dart';
import 'package:event_app/src/features/groups/pages/create_group.dart';
import 'package:flutter/material.dart';
import 'src/core/constants/strings.dart';
import 'src/core/utils/theme/theme_helper.dart';
import 'src/features/calendar/pages/calendar_screen.dart';
import 'src/features/start_up/pages/example_screen.dart';
// import 'src/features/start_up/pages/example_screen.dart';

>>>>>>> dev

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NoficationsTwoPage(),
=======
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      //TODO: Handle the app theming
      theme: theme,
      //TODO: Handle the app navigation
      // routes:


      home: const HomeScreenOne(),


>>>>>>> dev
    );
  }
}
