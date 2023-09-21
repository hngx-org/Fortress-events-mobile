import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomContainerRightIcon extends StatelessWidget {
  final String? displaydata;
  final VoidCallback? onPressed;
  final IconData? displayicon;

  const CustomContainerRightIcon({
    super.key,
    this.displaydata,
    this.onPressed,
    this.displayicon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          IconButton(
            onPressed: () {},
            icon: Icon(displayicon),
          ),
        ],
      ),
    );
  }
}
