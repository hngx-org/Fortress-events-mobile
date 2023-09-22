import 'package:flutter/material.dart';

import '../core/constants/dimensions.dart';
import '../core/utils/theme/colors.dart';
import '../core/utils/theme/text_styles.dart';

class StackedCircleAvatars extends StatelessWidget {
  final List<String> avatarImages;
  final String remainingAvatarCount;
  final double avatarRadius;
  final double avatarExternalRadius;
  final double avatarCountRadius;
  final double avatarCountExternalRadius;

  /// A custom widget that displays a list of avatars stacked in a row, with the last
  /// avatar displaying the remaining count of avatars.
  ///
  /// Example usage:
  /// ```dart
  ///StackedCircleAvatars(
  ///   avatarImages: randomImages,
  ///   remainingAvatarCount: '34',
  ///   avatarExternalRadius: 16,
  ///   avatarRadius: 14,
  ///   avatarCountExternalRadius: 16,
  ///   avatarCountRadius: 14,
  ///   )
  /// ```

  const StackedCircleAvatars({
    super.key,
    required this.avatarImages,
    required this.remainingAvatarCount,
    required this.avatarRadius,
    required this.avatarExternalRadius,
    required this.avatarCountRadius,
    required this.avatarCountExternalRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.small),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < avatarImages.length; i++)
                Align(
                  widthFactor: 0.5,
                  child: CircleAvatar(
                    radius: avatarExternalRadius,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: NetworkImage(avatarImages[i]),
                    ),
                  ),
                ),
            ],
          ),
          CircleAvatar(
            radius: avatarCountExternalRadius,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: avatarExternalRadius,
              backgroundColor: AppColors.gray50,
              child: Text(
                remainingAvatarCount,
                textAlign: TextAlign.center,
                style: AppTextStyles.textSmallMedium.copyWith(
                  color: AppColors.gray800,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
