import 'dart:convert';
import 'dart:developer';

import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/auth/model/profile_details/user.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/features/events/network/eventcall_api.dart';
import 'package:event_app/src/features/events/presentation/models/allusers_model/allusers_model.dart';
import 'package:event_app/src/features/events/presentation/models/allusers_model/users.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_text_field.dart';
import 'package:event_app/src/features/people_groups/pages/my_people_screen.dart';
import 'package:event_app/src/general_widgets/custom_container_text_field.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:event_app/src/general_widgets/dropdown_field.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_members.dart';

class CreateGroup extends ConsumerStatefulWidget {
  const CreateGroup({
    super.key,
  });
  static const routeName = '/create-group-screen';

  @override
  ConsumerState<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends ConsumerState<CreateGroup> {
   List<String> items = [];
   List<String> idArray = []; // Initialize an empty list to hold items

  // Function to add an item to the list
  void addItemToList(String newItem) {
    setState(() {
      items.add(newItem);
    });
  }
   void addIdToList(String newItem) {
    setState(() {
      idArray.add(newItem);
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await usersData();
    });
  }
  final TextEditingController _groupController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool validateForm() {
    if (_groupController.text.isEmpty || _descriptionController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Validation Error"),
            content: const Text("Please fill in all fields."),
            actions: [
              TextButton(
                child: const Text("OK"),
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
            title: const Text("Validation Error"),
            content: const Text("Please fill in all fields with valid data."),
            actions: [
              TextButton(
                child: const Text("OK"),
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
    final state = ref.watch(userNotifierProvider);
    final eventdata = {
      "creator_id": state.resp?.id,
      'title': _groupController.text,
      'description': _descriptionController.text,
      'users': idArray,
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
                    "Group Name",
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
                  DropDownField(
                    values: usersList,
                    // ['data 1', 'Data 2'],
                    hintText: 'Members',
                    label: 'Add Members',
                    onChanged: (value) {
                      if (items.contains(value)) {
                        return;
                      }
                     addItemToList(value!);
                     addIdToList(findUserIdByName(value)!);
                     log(value);
                     log(idArray.toString());

                    },
                  ),
                  const Spacing.mediumHeight(),
                  CustomTextField(
                    boxheight: MediaQuery.sizeOf(context).height * 0.2,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: items.toString(),
                    lines: 6,
                    
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

  List<String> usersList = ['Search'];

  List<Member>? members = [];
  Future usersData() async {
    final api = ApiServices();

    final MembersModel usersResponse = await api.getAllMembers();
    members = [...usersResponse.users ?? []];
    final allTitle = usersResponse.users!.map((e) => e.name ?? "").toList();
    print('data retreved lenght ${allTitle.length}');
    usersList = [...allTitle.toSet()];
    print('data in users stils  ${usersList.length}');
    setState(() {});
  }
  String? findUserIdByName(String? name) {
    if (name != null) {
      for (Member member in members ?? []) {
        if (member.name == name) {
          return member.id;
        }
      }
    }
    return null; // Return null if name is not found.
  }
}


// class MemberArray extends StatefulWidget {
//   const MemberArray({super.key});

//   @override
//   State<MemberArray> createState() => _MemberArrayState();
// }

// class _MemberArrayState extends State<MemberArray> {
 
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }

  
// }
