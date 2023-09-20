import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/general_widgets/custom_container_text_field.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Create Event",
                style: AppTextStyles.textMdBold.copyWith(
                  color: AppColors.gray900,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.medium),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: AppTextStyles.textXsMeduim.copyWith(
                            color: AppColors.gray900,
                          ),
                        ),
                        Spacing.smallHeight(),
                        CustomContainerTextField(
                          boxheight: MediaQuery.sizeOf(context).height * 0.06,
                          boxwidth: MediaQuery.sizeOf(context).width,
                          item: "Add Event Title",
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                        ),
                        CustomContainerTextField(
                          boxheight: MediaQuery.sizeOf(context).height * 0.2,
                          boxwidth: MediaQuery.sizeOf(context).width,
                          item: "Event Description",
                          lines: 6,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomContainerRightIcon(
                                      displaydata: "June 19",
                                      onPressed: () {},
                                      displayicon: Icons.calendar_today_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                             SizedBox(
                          width: 16,
                        ),
                             Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time"),
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomContainerRightIcon(
                              displaydata: "02:00pm",
                              onPressed: () {},
                              displayicon: Icons.watch,
                            ),
                          ],
                        ),
                          ],
                        ),
                          ],
                        ),
                       
                       
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select Group"),
                            Container(
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.search),
                                    ),
                                    Text(
                                      "Search Groups",
                                      style:
                                          AppTextStyles.textSmallRegular.copyWith(
                                        color: AppColors.gray700Main,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
