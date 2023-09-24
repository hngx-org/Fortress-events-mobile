import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class CustomContainerRightIcon extends StatelessWidget {
  final String? displaydata;
  final VoidCallback? onPressed;
  final String iconSvgPath;
  final Color iconColor;
  final TextEditingController? controller;

  const CustomContainerRightIcon({
    super.key,
    this.displaydata,
    this.onPressed,
    required this.iconSvgPath,
    required this.iconColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: MediaQuery.sizeOf(context).width * 0.40,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          border: Border.all(color: AppColors.gray500),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$displaydata",
                style: AppTextStyles.textSmallRegular.copyWith(
                  color: AppColors.gray700Main,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
              child: CustomImageView(
                svgPath: iconSvgPath,
                color: iconColor,
                height: Dimensions.medium,
                width: Dimensions.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
