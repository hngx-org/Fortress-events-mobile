import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/events/presentation/widgets/custom_container_text_righticon.dart';
import 'package:event_app/src/general_widgets/custom_container_text_field.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({super.key});
  static const routeName = '/create-group-screen';

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
                    "GroupName",
                    style: AppTextStyles.textXsMeduim.copyWith(
                      color: AppColors.gray900,
                    ),
                  ),
                  const Spacing.smallHeight(),
                  CustomContainerTextField(
                    boxheight: MediaQuery.sizeOf(context).height * 0.06,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: "Enter group name",
                  ),
                  const Spacing.mediumHeight(),
                  CustomContainerTextField(
                    boxheight: MediaQuery.sizeOf(context).height * 0.2,
                    boxwidth: MediaQuery.sizeOf(context).width,
                    item: "Group Description",
                    lines: 6,
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
    );
  }
}
