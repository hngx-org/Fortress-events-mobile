import 'package:event_app/src/features/people_groups/pages/my_people_screen.dart';
import 'package:event_app/src/features/start_up/pages/homepage_three.dart';
import 'package:event_app/src/features/start_up/pages/homepage_two.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'src/core/constants/strings.dart';
import 'src/core/utils/theme/theme_helper.dart';
import 'src/features/start_up/pages/homepage_one.dart';
import 'package:event_app/src/features/events/presentation/pages/create_event.dart';
import 'package:event_app/src/features/groups/pages/create_group.dart';
import 'src/features/calendar/pages/calendar_screen.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
void main() {
  runApp(const ProviderScope(
    child: FortressEventApp(),
  ));
}

class FortressEventApp extends StatelessWidget {
  const FortressEventApp({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      //TODO: Handle the app theming
      theme: theme,
      //TODO: Handle the app navigation
      // home: const HomeScreenOne(),
      home: CreateGroup(),
      routes: {
        HomeScreenOne.routeName: (context) => const HomeScreenOne(),
        HomepageTwo.routeName: (context) => const HomepageTwo(),
        TimeLineHomepageThree.routeName: (context) =>
            const TimeLineHomepageThree(),
        MyPeopleScreen.routeName: (context) => const MyPeopleScreen(),
        CreateGroup.routeName: (context) => CreateGroup(),
        CreateEvent.routeName: (context) => const CreateEvent(),
        CalendarScreen.routeName: (context) => const CalendarScreen(),
      },
    );
  }
}
