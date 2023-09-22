import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/app_decoration.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavhome,
      activeIcon: ImageConstant.imgNavhome,
      title: "Activity",
      type: BottomBarEnum.Activity,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavpeople,
      activeIcon: ImageConstant.imgNavpeople,
      title: "My People",
      type: BottomBarEnum.MyPeople,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlus,
      activeIcon: ImageConstant.imgPlus,
      title: "Addition",
      type: BottomBarEnum.Addition,
      // isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavrankings,
      activeIcon: ImageConstant.imgComputer,
      title: "Calender",
      type: BottomBarEnum.Calender,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      activeIcon: ImageConstant.imgSettings,
      title: "Settings",
      type: BottomBarEnum.Settings,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          top: BorderSide(
            color: appTheme.blueGray400,
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  svgPath: bottomMenuList[index].icon,
                  height: 20,
                  width: 20,
                  color: appTheme.blueGray600,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: appTheme.blueGray600,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 31,
                vertical: 22,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].activeIcon,
                    height: 20,
                    width: 20,
                    color: appTheme.blueGray600,
                    margin: const EdgeInsets.only(top: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 24,
                    ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: appTheme.blueGray600,
                      ),
                    ),
                  ),
                ],
              ),
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
    );
  }
}

enum BottomBarEnum {
  Activity,
  MyPeople,
  Addition,
  Calender,
  Settings,
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
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
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
