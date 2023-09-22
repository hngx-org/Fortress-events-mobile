import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_container.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme/colors.dart';
import '../../../../core/utils/theme/text_styles.dart';
import '../../../../general_widgets/stacked_circle_avatars.dart';
import '../../../people_groups/data/avatar_images.dart';

class HomepageThreeTimelineCard extends StatelessWidget {
  String titleText;
  String subTitileText;

  HomepageThreeTimelineCard({
    super.key,
    this.titleText = 'The Rapid UX Process',
    this.subTitileText =
        'Dive into the of creating seamless digital experiences.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: Dimensions.medium, vertical: Dimensions.medium),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        color: Colors.white, // Container color
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
                    style: AppTextStyles.textMdBold.copyWith(
                      color: AppColors.gray900,
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
              style: AppTextStyles.textXsRegular.copyWith(
                color: AppColors.gray800,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StackedCircleAvatars(
                avatarImages: randomImages,
                remainingAvatarCount: '34',
                avatarExternalRadius: 16,
                avatarRadius: 14,
                avatarCountExternalRadius: 16,
                avatarCountRadius: 14,
              ),
              const CustomIconContainer(
                containerText: '32',
                spacingWidth: Dimensions.tiny,
                containerColor: AppColors.accentGreen100,
                containerHPadding: Dimensions.smedium,
                containerVPadding: Dimensions.xsmall,
                iconSvgPath: 'assets/images/user.svg',
                iconColor: AppColors.primary1000,
                iconHeight: 16,
                iconWidth: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
