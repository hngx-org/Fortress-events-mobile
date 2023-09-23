import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/start_up/pages/homepage_two.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
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
                  style: AppTextStyles.rebondBigBold,
                ),
              ],
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
                    showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0))),
                      builder: (context) => const HomepageTwo(),
                    );
                  },
                  buttonTextStyle: AppTextStyles.textXsBold.copyWith(
                    color: AppColors.accentGreen100,
                  ),
                  buttonStyle: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    elevation: const MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF063B27),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.large),
                      ),
                    ),
                  ),
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
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) => const HomepageTwo(),
                    );
                  },
                  buttonTextStyle: AppTextStyles.textXsBold.copyWith(
                    color: AppColors.primary1000,
                  ),
                  buttonStyle: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    elevation: const MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.large),
                        side: const BorderSide(
                          color: AppColors.gray500,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacing.tinyHeight(),
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
