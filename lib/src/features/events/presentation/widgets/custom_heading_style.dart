import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String content;
  const CustomHeading({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: AppTextStyles.textXsMeduim.copyWith(
        color: AppColors.gray900,
      ),
    );
  }
}
