import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/calendar/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import '../../../core/constants/dimensions.dart';
import '../../../general_widgets/custom_image_view.dart';

class HomepageTwo extends StatelessWidget {
  const HomepageTwo({super.key});
  static const routeName = '/homepage-two-screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.medium, vertical: Dimensions.big),
          child: Text(
            'Welcome Onboard',
            style: AppTextStyles.textXlBold,
          ),
        ),
        Container(
          color: const Color(0xFFF2F4F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(Dimensions.medium),
                child: Text(
                  'Sign Up using:',
                  style: AppTextStyles.textSmallRegular,
                ),
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
                  margin: const EdgeInsets.only(
                    left: Dimensions.medium,
                    right: Dimensions.medium,
                    bottom: Dimensions.large,
                  ),
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
            ],
          ),
        ),
      ],
    );
  }
}
