import 'package:event_app/src/features/calendar/pages/test.dart';
import 'package:event_app/src/features/people_groups/pages/my_people_screen.dart';
import 'package:event_app/src/features/start_up/pages/homepage_three.dart';
import 'package:event_app/src/features/start_up/pages/homepage_two.dart';
import 'package:flutter/material.dart';
import 'src/core/constants/strings.dart';
import 'src/core/utils/theme/theme_helper.dart';
import 'src/features/settings_screen/widgets/make_a_wish_4_screen.dart';
import 'src/features/start_up/pages/homepage_one.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      //TODO: Handle the app theming
      theme: theme,
      //TODO: Handle the app navigation

      // routes:



      home: const HomeScreenOne(),
      // home: Dashboard(),
      routes: {
        HomeScreenOne.routeName: (context) => const HomeScreenOne(),
        HomepageTwo.routeName: (context) => const HomepageTwo(),
        TimeLineHomepageThree.routeName: (context) =>
            const TimeLineHomepageThree(),
        MyPeopleScreen.routeName: (context) => const MyPeopleScreen(),
        CreateGroup.routeName: (context) => const CreateGroup(),
        CreateEvent.routeName: (context) => const CreateEvent(),
        CalendarScreen.routeName: (context) => const CalendarScreen(),
      },


    );
  }
}
