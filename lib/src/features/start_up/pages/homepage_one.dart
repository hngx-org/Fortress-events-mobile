import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/general_widgets/base_button.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_homepage_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_button.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

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
                HompageButtons(
                  buttonColor: AppColors.primary1000,
                  buttonTitle: 'Get Started',
                  buttonTitleColor: AppColors.accentGreen100,
                ),
                SizedBox(height: Dimensions.tiny,),
                HompageButtons(
                  buttonColor: AppColors.accentGreen100,
                  buttonTitle: 'Sign in',
                  buttonTitleColor: AppColors.primary1000,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
