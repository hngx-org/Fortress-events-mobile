import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/first_homescreen_button.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  svgPath: 'assets/images/home_screen_logo.svg',
                ),
                SizedBox(
                  height: Dimensions.medium,
                ),
                Center(
                  child: CustomImageView(
                    svgPath: 'assets/images/wetin_dey_sup.svg',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: Dimensions.large,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.medium),
              child: Column(
                children: [
                  FirstHomeScreenButton(
                    textColor: Color(0xFFCFFF96),
                  ),
                  SizedBox(
                    height: Dimensions.small,
                  ),
                  FirstHomeScreenButton(
                      backgroundColor: Color(0xFF),
                      buttonText: 'Sign In',
                      textColor: Color(0xFF063B27))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
