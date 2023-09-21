import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/people_groups/widgets/people_group_card.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/theme/colors.dart';
import '../../../general_widgets/spacing.dart';

class MyPeopleScreen extends StatelessWidget {
  const MyPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        title: Text(
          'My People',
          style: AppTextStyles.textXlBold.copyWith(
            color: AppColors.gray1000,
          ),
        ),
        actions: [
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {},
            child: Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgPlusLightGreenA100,
                  color: AppColors.primary1000,
                  height: 24,
                  width: 24,
                ),
                const Spacing.smallWidth(),
                Text(
                  'Add Group',
                  style: AppTextStyles.textSmallSemibold
                      .copyWith(color: AppColors.primary1000),
                ),
                const Spacing.mediumWidth(),
              ],
            ),
          )
        ],
        scrolledUnderElevation: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.medium),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Spacing.mediumHeight(),
          itemBuilder: (context, index) => const PeopleGroupCard(
            groupName: 'Techies 💻',
            groupDescription: 'Where we talk about anything tech-related',
          ),
          itemCount: 2,
        ),
      ),
    );
  }
}
