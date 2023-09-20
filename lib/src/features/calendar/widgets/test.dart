import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/app_decoration.dart';
import 'package:event_app/src/core/utils/theme/custom_text_style.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
// import 'package:kooha_task/src/core/app_export.dart';

class CustomBottomBar1 extends StatefulWidget {
  CustomBottomBar1({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBar1State createState() => CustomBottomBar1State();
}

class CustomBottomBar1State extends State<CustomBottomBar1> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavhome,
      activeIcon: ImageConstant.imgNavhome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgComputer,
      activeIcon: ImageConstant.imgComputer,
      title: "Wallet",
      type: BottomBarEnum.Wallet,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlus,
      activeIcon: ImageConstant.imgPlus,
      title: "Wallet",
      type: BottomBarEnum.Wallet,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgComputer,
      activeIcon: ImageConstant.imgComputer,
      title: "Inbox",
      type: BottomBarEnum.Inbox,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgComputer,
      activeIcon: ImageConstant.imgComputer,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: double.maxFinite,
          child: Divider(),
        ),
        SizedBox(
          height: 100,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              if (bottomMenuList[index].isCircle) {
                return BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 11,
                    ),
                    decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomImageView(
                      svgPath: bottomMenuList[index].icon,
                      height: 20,
                      width: 20,
                      color: theme.colorScheme.secondaryContainer,
                      margin: EdgeInsets.symmetric(vertical: 11),
                    ),
                  ),
                  label: '',
                );
              }
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: bottomMenuList[index].icon,
                      height: 24,
                      width: 24,
                      color: theme.colorScheme.secondaryContainer,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: theme.colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: bottomMenuList[index].activeIcon,
                      height: 24,
                      width: 24,
                      color: theme.colorScheme.onErrorContainer,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: CustomTextStyles.bodySmallBluegray300.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex = index;
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  Home,
  Wallet,
  Inbox,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isCircle = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Screen Found',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
