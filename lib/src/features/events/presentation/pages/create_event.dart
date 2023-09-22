import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_left_icon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_heading_style.dart';
import 'package:event_app/src/general_widgets/custom_container_text_field.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/general_widgets/custom_icon_container.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../../../people_groups/pages/my_people_screen.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  static const routeName = '/create-event-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        title: Text(
          'Create Event',
          style: AppTextStyles.textXlBold.copyWith(
            color: AppColors.gray1000,
          ),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: const Icon(Icons.close),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.medium),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: AppTextStyles.textXsMeduim.copyWith(
                      color: AppColors.gray900,
                    ),
                  ),
                  const Spacing.mediumHeight(),
                  CustomContainerTextField(
                    boxheight: 52,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: "Add Event Title",
                  ),
                  const Spacing.mediumHeight(),
                  CustomContainerTextField(
                    boxheight: 85,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: "Event Description",
                    lines: 6,
                  ),
                  const Spacing.mediumHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Date"),
                          const Spacing.mediumHeight(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomContainerRightIcon(
                                displaydata: "June 19",
                                onPressed: () {},
                                iconSvgPath: ImageConstant.imgCalendar,
                                iconColor: AppColors.gray700Main,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomHeading(
                            content: 'Time',
                          ),
                          const Spacing.mediumHeight(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomContainerRightIcon(
                                displaydata: "02:00pm",
                                onPressed: () {},
                                iconSvgPath: ImageConstant.imgClock,
                                iconColor: AppColors.gray700Main,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacing.mediumHeight(),
                  CustomIconContainer(
                    containerText: " Add Location",
                    spacingWidth: Dimensions.tiny,
                    containerColor: AppColors.gray300,
                    containerHPadding: 16,
                    containerVPadding: 8,
                    iconSvgPath: ImageConstant.imgLocation,
                    iconColor: AppColors.gray900,
                    iconHeight: 20,
                    iconWidth: 20,
                    containerHeight: Dimensions.small * 5,
                    containerWidth: Dimensions.smedium * 13,
                    onTap: () {},
                  ),
                  const Spacing.mediumHeight(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Select Group"),
                      const Spacing.mediumHeight(),
                      CustomContainerLeftIcon(
                        iconSvgPath: ImageConstant.imgSearchnormal,
                        iconColor: AppColors.gray700Main,
                        containerHeight: 52,
                        containerWidth: double.infinity,
                        displaydata: 'Search Groups',
                      ),
                    ],
                  ),
                ],
              ),
              const Spacing.mediumHeight(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary1000,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyPeopleScreen(),
            ),
          );
        },
        child: CustomImageView(
          svgPath: ImageConstant.imgArrowRight,
          color: AppColors.accentGreen100,
        ),
      ),
    );
  }
}
