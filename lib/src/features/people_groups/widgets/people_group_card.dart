import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/people_groups/data/avatar_images.dart';
import 'package:event_app/src/general_widgets/stacked_circle_avatars.dart';
import 'package:event_app/src/general_widgets/custom_icon_container.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/image_constant.dart';

class PeopleGroupCard extends StatelessWidget {
  final String groupName;
  final String groupDescription;
  final VoidCallback onTap;

  const PeopleGroupCard(
      {super.key,
      required this.groupName,
      required this.groupDescription,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          Dimensions.medium,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.medium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  groupName,
                  style: AppTextStyles.textMdBold.copyWith(
                    color: AppColors.gray1000,
                  ),
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgArrowRight,
                  color: AppColors.gray1000,
                  height: 24,
                  width: 24,
                  onTap: () {},
                ),
              ],
            ),
            const Spacing.smallHeight(),
            /* Text(
              groupDescription,
              style: AppTextStyles.textXsRegular.copyWith(
                color: AppColors.gray800,
              ),
            ), */
            const Spacing.smallHeight(),
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
                CustomIconContainer(
                  containerText: '14 Events',
                  containerTextStyle: AppTextStyles.textXsMeduim.copyWith(
                    color: AppColors.primary1000,
                    height: 1.35,
                  ),
                  containerColor: AppColors.accentGreen100,
                  containerHPadding: Dimensions.smedium,
                  containerVPadding: Dimensions.small,
                  iconSvgPath: ImageConstant.imgCalendar,
                  iconColor: AppColors.primary1000,
                  iconHeight: 16,
                  iconWidth: 16,
                  spacingWidth: Dimensions.tiny,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
