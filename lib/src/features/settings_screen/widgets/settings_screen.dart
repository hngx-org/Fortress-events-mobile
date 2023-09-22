import 'package:flutter/material.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import '/src/features/settings_screen/widgets/widgets/settings.dart';
import '/src/features/settings_screen/widgets/widgets/user_profile.dart';
import '/src/general_widgets/spacing.dart';

//main screen for settings
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Change this to custom appbar
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      //TODO: implement reusable bottom bar widget
      //bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserProfile(),
            const Spacing.mediumHeight(),
            SettingsCustomization(settings: settingList1),
            SettingsCustomization(settings: settingList2),
            SettingsCustomization(settings: settingList3),
          ],
        ),
      ),
    );
  }
}

class User {
  static String handle = "Salome", email = 'salome367@gmail.com';
  static var profileImage = AssetImage(ImageConstant.imgSalomeDP);

  //const NetworkImage("https://via.placeholder.com/110x110");
}
