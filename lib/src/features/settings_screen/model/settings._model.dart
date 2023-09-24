// class model for settings screen
import 'package:flutter/material.dart';

import '/src/core/utils/image_constant.dart';

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
