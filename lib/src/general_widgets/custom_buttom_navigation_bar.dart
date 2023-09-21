import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/features/start_up/pages/example_screen.dart';
import 'package:event_app/src/general_widgets/custom_icon_button.dart';
import 'package:event_app/src/general_widgets/general_widgets_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationButton extends StatefulWidget {
  const BottomNavigationButton({Key? key}) : super(key: key);
  @override
  State<BottomNavigationButton> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationButton> {
  int _Index = 0;

  final List<Widget> _BottomNavigationList = [
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.brown,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BottomNavigationList[_Index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _Index,
        onTap: (int index) {
          setState(() {
            _Index = index;
          });
        },
        backgroundColor: const Color(0Xffffffff),
        selectedItemColor: const Color(0XFF063B27),
        unselectedItemColor: const Color(0xFF98A2B3),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(
          color: Color(0XFF063B27),
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFF98A2B3),
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgActivity,
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgMyPeople,
            ),
            label: 'My People',
          ),
          BottomNavigationBarItem(
              icon: CustomIconButton(
                height: 52,
                width: 52,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF063B27),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.teal900.withOpacity(0.31),
                      spreadRadius: 4,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 52,
                  width: 52,
                  child: SvgPicture.asset(
                    ImageConstant.imgAdd,
                  ),
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgCalender,
            ),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.imgSettings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}