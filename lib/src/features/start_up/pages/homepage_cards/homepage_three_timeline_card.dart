import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class HomepageThreeTimelineCard extends StatelessWidget {
  String titleText;
  String subTitileText;

  HomepageThreeTimelineCard({
    this.titleText = 'The Rapid UX Process',
    this.subTitileText =
        'dive into the of creating seamless digital experiences.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.medium, vertical: Dimensions.medium),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        color: Colors.white, // Container color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 3), // Shadow offset
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    svgPath: 'assets/images/timeline_online_icon.svg',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryBlack,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              CustomImageView(
                svgPath: 'assets/images/more.svg',
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(right: 36),
            child: Text(
              subTitileText,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: 'assets/images/timeline_avatar_group.png',
                ),
                CustomElevatedButton(
                  leftIcon: CustomImageView(
                    svgPath: 'assets/images/user.svg',
                  ),
                  width: 56,
                  text: ' 32',
                  buttonTextStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
