import 'dart:convert';

import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/events/network/eventcall_api.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_left_icon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_heading_style.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_text_field.dart';
import 'package:event_app/src/features/people_groups/pages/my_people_screen.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:event_app/src/general_widgets/custom_icon_container.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  static const routeName = '/create-event-screen';

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  _registerevent(){
    var eventdata= {
'    title': _titleController.text,
    'description': _descriptionController.text,	
    'location': _locationController.text,
    'start_date': _dateController.text,
    'start_time': _timeController.text,

    };
    var res = CallApi().postData(eventdata, 'events');
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.baseWhite,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Create Event",
                    style: AppTextStyles.textMdBold.copyWith(
                      color: AppColors.gray700Main,
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
                Spacing.smallHeight(),
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
                            CustomTextField(
                              boxheight: 52,
                              boxwidth: MediaQuery.sizeOf(context).width,
                              item: "Add Event Title",
                              TextEditingController: _timeController,
                            ),
                            Spacing.smallHeight(),
                            CustomTextField(
                              boxheight: 85,
                              boxwidth: MediaQuery.sizeOf(context).width,
                              item: "Event Description",
                              lines: 6,
                              TextEditingController: _descriptionController,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.04,
                            ),
                            Text(
                              "Location",
                              style: AppTextStyles.textXsMeduim.copyWith(
                                color: AppColors.gray900,
                              ),
                            ),
                            Spacing.smallHeight(),
                            CustomTextField(
                              boxheight: 52,
                              boxwidth: MediaQuery.sizeOf(context).width,
                              item: "Add Location",
                              TextEditingController: _locationController,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date"),
                                    Spacing.smallHeight(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomContainerRightIcon(
                                          displaydata: "June 19",
                                          onPressed: () {},
                                          iconSvgPath:
                                              ImageConstant.imgCalendar,
                                          iconColor: AppColors.gray700Main,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacing.mediumWidth(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomHeading(
                                      content: 'Time',
                                    ),
                                    Spacing.smallHeight(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            Spacing.smallHeight(),
                            CustomIconContainer(
                              containerText: " Add Location",
                              spacingWidth: 4,
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
                            Spacing.smallHeight(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Select Group"),
                                Spacing.smallHeight(),
                                CustomContainerLeftIcon(
                                  iconSvgPath: ImageConstant.imgSearchnormal,
                                  iconColor: AppColors.gray700Main,
                                  containerHeight: 52,
                                  containerWidth: 343,
                                  displaydata: 'Search Groups',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacing.smallHeight(),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  text: 'Create Event',
                  height: 30,
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary1000,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  width: 80,
                  onTap: () {
                    _registerevent();
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary1000,
          onPressed: () {
            //todo: Nav to the my people screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPeopleScreen()),
            );
          },
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowRight,
            color: AppColors.accentGreen100,
          ),
        ),
      ),
    );
  }
}
