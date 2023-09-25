import 'dart:convert';
import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/date_time_utils.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/features/events/network/eventcall_api.dart';
import 'package:event_app/src/features/events/presentation/models/groups_model/group.dart';
import 'package:event_app/src/features/events/presentation/models/groups_model/groups_model.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_left_icon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_heading_style.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_text_field.dart';
import 'package:event_app/src/features/people_groups/pages/my_people_screen.dart';
import 'package:event_app/src/features/start_up/pages/homepage_three.dart';

import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/dropdown_field.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

import 'package:intl/intl.dart';

class CreateEvent extends ConsumerStatefulWidget {
  const CreateEvent({super.key});

  static const routeName = '/create-event-screen';

  @override
  ConsumerState<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends ConsumerState<CreateEvent> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await groupsData();
    });
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();

  bool validateForm() {
    if (_titleController.text.isEmpty ||
            _descriptionController.text.isEmpty ||
            _locationController.text.isEmpty
        // _dateController.text.isEmpty ||
        // _timeController.text.isEmpty ||
        // _groupController.text.isEmpty
        ) {
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
    } else if (_titleController.text.length < 3 ||
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

  Future _registerevent() async {
    if (!validateForm()) {
      return; // Don't proceed if form is not valid
    }
    final state = ref.watch(userNotifierProvider);
    final eventdata = {
      "creator_id": state.resp?.id,
      'title': _titleController.text,
      'description': _descriptionController.text,
      'location': _locationController.text,
      'start_date': _dateController.text,
      'start_time': _timeController.text,
      'group_id': _groupController.text, //'05dc4497-9993-4aa2-b0d8-ab679dc98ace
    };

    log('Event Data => ${eventdata.toString()}');

    final response = await CallApi().postData(eventdata, 'events');
    log('response: ${response?.body ?? ''}');
    if (response != null) {
      if (response.statusCode == 201) {
        var body = json.decode(response.body);
        log('Decoded body : $body');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Event Created",
                  style: AppTextStyles.textXsBoldTitle.copyWith(
                    color: AppColors.primary700Main,
                  )),
              content: Text("You have successfully created an event."),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPeopleScreen()),
                    );
                  },
                ),
              ],
            );
          },
        );
      } else {
        log('Error');
      }
    } else {
      print("Error: Unable to send data. Check your internet connection.");
    }
  }

  DateTime selectedDate = DateTime.now();

  Future _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.format('yyyy-MM-dd');
      });
    }
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
                          Spacing.smallHeight(),
                          CustomTextField(
                            boxheight: 52,
                            boxwidth: MediaQuery.sizeOf(context).width,
                            item: "Add Event Title",
                            controller: _titleController,
                          ),
                          Spacing.bigHeight(),
                          CustomTextField(
                            boxheight: 85,
                            boxwidth: MediaQuery.sizeOf(context).width,
                            item: "Event Description",
                            lines: 6,
                            controller: _descriptionController,
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
                            controller: _locationController,
                          ),
                          Spacing.smallHeight(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        displaydata: _dateController.text,
                                        iconSvgPath: ImageConstant.imgCalendar,
                                        iconColor: AppColors.gray700Main,
                                        onPressed: () async {
                                          final date = await openDatePicker(
                                              context: context);
                                          _dateController.text =
                                              date ?? '01/01/23';
                                          setState(() {});
                                        },
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
                                        controller: _timeController,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacing.smallHeight(),
                          DropDownField(
                            values: groupsList,
                            // ['data 1', 'Data 2'],
                            hintText: 'Groups',
                            label: 'Search Group',
                            onChanged: (p0) {
                              setState(() {
                                String? selectedGroupId =
                                    findGroupIdByTitle(p0);
                                _groupController.text = selectedGroupId ?? '';
                              });
                              debugLog(
                                  'title => $p0\n id => ${_groupController.text}');
                            },
                          )
                        ],
                      ),
                      Spacing.largeHeight(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary1000,
          onPressed: () async {
            await _registerevent();
          },
          child: CustomImageView(
            svgPath: ImageConstant.imgArrowRight,
            color: AppColors.accentGreen100,
          ),
        ),
      ),
    );
  }

  Future<String?> openDatePicker({
    required BuildContext context,
  }) async {
    final today = DateTime.now();
    String formattedDate = '';
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime.utc(1900),
        lastDate: today.add(
          const Duration(days: 30 * 3),
        ),
        builder: (BuildContext context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.gray900,
              ),
            ),
            child: child!,
          );
        });

    if (pickedDate != null) {
      formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      return formattedDate;
    }

    return null;
  }

  List<String> groupsList = ['Search'];

  List<Group>? groups = [];
  Future groupsData() async {
    final api = ApiServices();

    final GroupsModel groupsResponse = await api.getAllGroups();
    groups = [...groupsResponse.groups ?? []];
    final allTitle = groupsResponse.groups!.map((e) => e.title ?? "").toList();
    print('data retreved lenght ${allTitle.length}');
    groupsList = [...allTitle.toSet()];
    print('data in groups stils  ${groupsList.length}');
    setState(() {});
  }

  String? findGroupIdByTitle(String? title) {
    if (title != null) {
      for (Group group in groups ?? []) {
        if (group.title == title) {
          return group.id;
        }
      }
    }
    return null; // Return null if title is not found.
  }
}
