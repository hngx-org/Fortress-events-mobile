import 'dart:convert';
import 'dart:developer';

import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/events/network/eventcall_api.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_text_field.dart';
import 'package:event_app/src/features/people_groups/pages/my_people_screen.dart';
import 'package:event_app/src/general_widgets/custom_container_text_field.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({
    super.key,
  });
  static const routeName = '/create-group-screen';

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final TextEditingController _groupController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool validateForm() {
    if (_groupController.text.isEmpty || _descriptionController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Validation Error"),
            content: Text("Please fill in all fields."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
      return false;
    } else if (_groupController.text.length < 3 ||
        _descriptionController.text.length < 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Validation Error"),
            content: Text("Please fill in all fields with valid data."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }

  Future _registergroup() async {
    if (!validateForm()) {
      return; // Don't proceed if form is not valid
    }
    final eventdata = {
      "creator_id": "creator_id",
      'title': _groupController.text,
      'description': _descriptionController.text,
    };

    log('Evernt Data => ${eventdata.toString()}');

    var response = await CallApi().postData(eventdata, 'groups');
    if (response != null) {
      if (response.statusCode == 201) {
        var body = json.decode(response.body);
        log('Body response => $body');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyPeopleScreen()),
        );
      } else {
        print("Error: HTTP ${response.statusCode} - ${response.reasonPhrase}");
      }
    } else {
      print("Error: Unable to send data. Check your internet connection.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        title: Text(
          'Add Group',
          style: AppTextStyles.textXlBold.copyWith(
            color: AppColors.gray1000,
          ),
        ),
        actions: [
          IconButton.filledTonal(
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: Navigator.of(context).pop,
            icon: Icon(Icons.close),
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
                    "GroupName",
                    style: AppTextStyles.textXsMeduim.copyWith(
                      color: AppColors.gray900,
                    ),
                  ),
                  const Spacing.smallHeight(),
                  CustomTextField(
                    boxheight: MediaQuery.sizeOf(context).height * 0.06,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: "Enter group name",
                    controller: _groupController,
                  ),
                  const Spacing.mediumHeight(),
                  CustomTextField(
                    boxheight: MediaQuery.sizeOf(context).height * 0.2,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: "Group Description",
                    lines: 6,
                    controller: _descriptionController,
                  ),
                  const Spacing.mediumHeight(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Add Members"),
                      const Spacing.smallHeight(),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.gray500),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                              ),
                              Text(
                                "Search People...",
                                style: AppTextStyles.textSmallRegular.copyWith(
                                  color: AppColors.gray700Main,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary1000,
        child: CustomImageView(
          svgPath: ImageConstant.imgArrowRight,
          color: AppColors.accentGreen100,
        ),
        onPressed: () {
          _registergroup();
        },
      ),
    );
  }
}
