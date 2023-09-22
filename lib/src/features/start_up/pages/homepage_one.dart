import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/features/start_up/pages/homepage_two.dart';
import 'package:event_app/src/general_widgets/base_button.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_homepage_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_button.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class HomeScreenOne extends StatelessWidget {
  const HomeScreenOne({super.key});
  static const routeName = '/homepage-one-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    svgPath: 'assets/images/homepage_logo.svg',
                  ),
                  const SizedBox(
                    height: Dimensions.medium,
                  ),
                  const Text(
                    'Wetin Dey Sup?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.medium,
            left: Dimensions.medium,
            right: Dimensions.medium,
            child: Column(
              children: [
                CustomElevatedButton(
                  text: 'Get Started',
                  height: 48,
                  onTap: () {
                    Navigator.pushNamed(context, HomepageTwo.routeName);
                  },
                  buttonTextStyle: const TextStyle(
                    color: Color(0xFFCFFF92),
                    fontSize: 12,
                  ),
                  buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF063B27))),
                ),
                const Spacing.smallHeight(),
                // HompageButtons(
                //   buttonColor: const Color(0xFF063B27),
                //   buttonTitle: 'Get Started',
                //   buttonTitleColor: const Color(0xFFCFFF92),
                // ),
                // const SizedBox(
                //   height: Dimensions.tiny,
                // ),
                CustomElevatedButton(
                  text: 'Sign in',
                  height: 48,
                  onTap: () {
                    Navigator.pushNamed(context, HomepageTwo.routeName);
                  },
                  buttonTextStyle: const TextStyle(
                    color: Color(0xFF063B27),
                    fontSize: 12,
                  ),
                  buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
                // HompageButtons(
                //   buttonColor: const Color(0xFFCFFF92),
                //   buttonTitle: 'Sign in',
                //   buttonTitleColor: const Color(0xFF063B27),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
