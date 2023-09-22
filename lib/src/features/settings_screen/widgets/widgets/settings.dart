import 'package:flutter/material.dart';

// custom widget used to customize subsettings
class SettingsCustomization extends StatelessWidget {
  final List<Settings> settings;
  const SettingsCustomization({super.key, required this.settings});

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
                  ? ListTile(
                      horizontalTitleGap: 1,
                      leading: e.leadingIcon,
                      title: Text(
                        e.settingName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: e.trailingIcon,
                    )
                  : ListTile(
                      title: Text(
                        e.settingName,
                        style: TextStyle(color: e.color),
                      ),
                      trailing: e.trailingIcon,
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
  final Icon? leadingIcon;
  final Icon trailingIcon;
  final Color? color;
  Settings({
    required this.settingName,
    this.trailingIcon = const Icon(Icons.arrow_forward_ios_rounded),
    this.leadingIcon,
    this.color,
  });
}

// sub settings datas defined using the setting model class
final List<Settings> settingList1 = [
  Settings(
    leadingIcon: const Icon(
      Icons.brush_outlined,
    ),
    settingName: "Appearance",
  ),
  Settings(
      leadingIcon: const Icon(Icons.language),
      settingName: "Languages & Region"),
];

final List<Settings> settingList2 = [
  Settings(
    leadingIcon: const Icon(Icons.live_help_outlined),
    settingName: "Help & Support",
  ),
  Settings(
    leadingIcon: const Icon(Icons.info_outline_rounded),
    settingName: "About",
  )
];

final List<Settings> settingList3 = [
  Settings(
    settingName: "Logout",
    trailingIcon: const Icon(
      Icons.logout_outlined,
      color: Colors.red,
    ),
    color: Colors.red,
  ),
];
