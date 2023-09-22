import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconAndText extends StatelessWidget {
  final Color iconColor;
  final int count;
  final String imagePath;
  const CustomIconAndText({
    super.key,
    required this.iconColor,
    required this.count,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.biggerMedium,
      width: 40,
      child: Row(
        children: [
          // Icon
          ColorFiltered(
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            child: SvgPicture.asset(
              imagePath,
            ),
          ),

          const SizedBox(
            width: Dimensions.tiny,
          ),
          Text(
            count.toString(),
            style: CustomTextStyles.titleSmallPrimary900,
          ),
        ],
      ),
    );
  }
}
