import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/features/start_up/pages/homepage_cards/homepage_three_timeline_card.dart';
import 'package:event_app/src/general_widgets/custom_buttom_navigation_bar.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/theme/text_styles.dart';

class TimeLineHomepageThree extends StatefulWidget {
  const TimeLineHomepageThree({super.key});
  static const routeName = '/homepage-three-screen';

  @override
  State<TimeLineHomepageThree> createState() => _TimeLineHomepageThreeState();
}

class _TimeLineHomepageThreeState extends State<TimeLineHomepageThree> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 76,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              // Adjust the height as needed
              child: TabBar(
                labelColor: const Color(0xFF063B27),
                unselectedLabelColor: const Color(0xFF667085),
                overlayColor: MaterialStateProperty.all(
                  const Color(0xFF063B27),
                ),
                tabs: const [
                  Tab(text: 'Everyone'),
                  Tab(text: 'Friends'),
                ],
                indicator: const BoxDecoration(
                  // Customize the indicator's appearance
                  color: Color(0xFFCFFF92),
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primary900,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Timeline',
                  style: AppTextStyles.textXlBold.copyWith(
                    color: AppColors.gray1000,
                  ),
                ),
                CustomImageView(
                  svgPath: 'assets/images/search_timeline.svg',
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(
              Dimensions.medium,
              Dimensions.medium,
              Dimensions.medium,
              0,
            ),
            child: ListView.builder(itemBuilder: (context, index) {
              return HomepageThreeTimelineCard();
            }),
          )),
    );
  }
}
