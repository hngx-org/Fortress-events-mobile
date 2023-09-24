import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:flutter/material.dart';

import '/src/core/utils/theme/text_styles.dart';
import '/src/core/utils/theme/colors.dart';
import '/src/features/settings_screen/model/settings._model.dart';
import '/src/general_widgets/spacing.dart';
import '../widget/settings.dart';
import '../widget/user_profile.dart';

//main screen for settings
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          'Settings',
          style: AppTextStyles.textXlBold.copyWith(
            color: AppColors.gray1000,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserProfile(),
            const Spacing.mediumHeight(),
            SettingsCustomization(settings: settingList1),
            SettingsCustomization(settings: settingList2),
            SettingsCustomization(
              settings: settingList3,
              apiServices: ApiServices(),
            ),
          ],
        ),
      ),
    );
  }
}
