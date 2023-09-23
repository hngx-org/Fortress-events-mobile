import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

// custom widget used to customize subsettings
class SettingsCustomization extends StatelessWidget {
  final List<Settings> settings;
  const SettingsCustomization({super.key, required this.settings});

  _showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Feature coming soon"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        child: Column(
          children: [
            ...settings.map(
              (e) => e.leadingIcon != null
                  ? GestureDetector(
                      onTap: () => _showAlertDialog(context),
                      child: ListTile(
                        horizontalTitleGap: 1,
                        leading: SizedBox(height: 20, child: e.leadingIcon),
                        title: Text(
                          e.settingName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: SizedBox(
                          height: 20,
                          child: e.trailingIcon,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => _showAlertDialog(context),
                      child: ListTile(
                        title: Text(
                          e.settingName,
                          style: TextStyle(color: e.color),
                        ),
                        trailing: SizedBox(
                          height: 20,
                          child: e.trailingIcon,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// class model for settings screen
class Settings {
  final String settingName;
  final Image? leadingIcon;
  final Image trailingIcon;
  final Color? color;
  Settings({
    required this.settingName,
    required this.trailingIcon,
    this.leadingIcon,
    this.color,
  });
}

// sub settings datas defined using the setting model class
Image defaultIcon = Image.asset(ImageConstant.arrowRightIcon);
final List<Settings> settingList1 = [
  Settings(
    leadingIcon: Image.asset(ImageConstant.appearanceIcon),
    settingName: "Appearance",
    trailingIcon: defaultIcon,
  ),
  Settings(
    leadingIcon: Image.asset(ImageConstant.languageRegionIcon),
    settingName: "Languages & Region",
    trailingIcon: defaultIcon,
  ),
];
final List<Settings> settingList2 = [
  Settings(
    leadingIcon: Image.asset(ImageConstant.helpSupportIcon),
    settingName: "Help & Support",
    trailingIcon: defaultIcon,
  ),
  Settings(
    leadingIcon: Image.asset(ImageConstant.aboutIcon),
    settingName: "About",
    trailingIcon: defaultIcon,
  )
];

final List<Settings> settingList3 = [
  Settings(
    settingName: "Logout",
    trailingIcon: Image.asset(ImageConstant.logoutIcon),
    color: Colors.red,
  ),
];
