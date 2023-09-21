import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/general_widgets/base_button.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_homepage_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_button.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class HomeScreenOne extends StatelessWidget {
  const HomeScreenOne({super.key});

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
                  SizedBox(
                    height: Dimensions.medium,
                  ),
                  const Text(
                    'Wetin Dey Sup?',
                    style: AppTextStyles.rebondBigBold,
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
                HompageButtons(
                  buttonColor: Color(0xFF063B27),
                  buttonTitle: 'Get Started',
                  buttonTitleColor: Color(0xFFCFFF92),
                ),
                SizedBox(
                  height: Dimensions.tiny,
                ),
                HompageButtons(
                  buttonColor: Color(0xFFCFFF92),
                  buttonTitle: 'Sign in',
                  buttonTitleColor: Color(0xFF063B27),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
