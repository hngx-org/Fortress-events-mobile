import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CustomContainerLeftIcon extends StatelessWidget {
  final String? displaydata;
  final VoidCallback? onPressed;
  final String iconSvgPath;
  final Color iconColor;
  final double containerHeight;
  final double containerWidth;
  final TextEditingController? controller;

  const CustomContainerLeftIcon({
    super.key,
    this.displaydata,
    this.onPressed,
    required this.iconSvgPath,
    required this.iconColor,
    required this.containerHeight,
    required this.containerWidth,
    this.controller,
 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          border: Border.all(color: AppColors.gray500),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: iconSvgPath,
                color: iconColor,
                height: Dimensions.medium,
                width: Dimensions.medium,
              ),
              const Spacing.smallWidth(),
              Text(
                "$displaydata",
                style: AppTextStyles.textSmallRegular.copyWith(
                  color: AppColors.gray700Main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
