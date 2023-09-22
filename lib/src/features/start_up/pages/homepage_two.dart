import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/calendar/pages/dashboard.dart';
import 'package:event_app/src/features/start_up/pages/homepage_three.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/first_homescreen_button.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';
import '../../../general_widgets/custom_homepage_button.dart';
import '../../../general_widgets/custom_image_view.dart';

class HomepageTwo extends StatelessWidget {
  const HomepageTwo({super.key});
  static const routeName = '/homepage-two-screen';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.35,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            // Adjust the radius as needed
            topRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
          color: Colors.white, // Container background color
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.medium, vertical: Dimensions.big),
              child: Text(
                'Welcome Onboard',
                style:
                    AppTextStyles.textXlBold.copyWith(fontSize: Dimensions.big),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFFF2F4F7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(Dimensions.medium),
                    child: Text(
                      'Sign Up using:',
                      style: AppTextStyles.textSmallBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, TimeLineHomepageThree.routeName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: Dimensions.medium),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        // Rounded edges
                        color: Colors.white,
                        // White background color
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            svgPath: 'assets/images/google_icon.svg',
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            'Google',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacing.height(52)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
