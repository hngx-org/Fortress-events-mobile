import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
// import 'package:event_app/src/core/utils/theme/theme_helper.dart';
// import 'package:event_app/src/general_widgets/base_button.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_button.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Column(
        children: [
          const Text('Hello World'),
          CustomElevatedButton(
            text: "Fortess",
            rightIcon: const Icon(Icons.abc_rounded),
            margin: const EdgeInsets.all(Dimensions.medium),
          ),
          const Spacing.mediumHeight(),
          CustomIconButton(decoration: BoxDecoration(color: Colors.amber)),
          const Spacing.mediumHeight(),
          CustomImageView(
            height: 100,
            width: 100,
            // imagePath: ImageConstant.imgFrame2,
            url: 'jsj',
          ),
          CustomImageView(
            color: Colors.amber,
            svgPath: ImageConstant.imgAlarm,
          ),
        ],
      ),
    );
  }
}
