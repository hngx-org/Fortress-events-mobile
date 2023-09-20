

import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomContainerTextField extends StatelessWidget {
  final double? boxheight;
  final String? item;
  final double? boxwidth;
  final int? lines;
  

  const CustomContainerTextField({
    super.key,
    this.boxheight,
    this.item,
    this.boxwidth,
    this.lines = 1, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxheight,
      width: boxwidth,
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        border: Border.all(color: AppColors.gray500),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
       maxLines: lines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: item,
          hintStyle: AppTextStyles.textSmallRegular.copyWith(
            color: AppColors.gray700Main,
          ),
          ),
          
        ),
        
      );
    
  }
}
