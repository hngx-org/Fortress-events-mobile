import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/text_styles.dart';
import 'package:event_app/src/features/groups/pages/create_group.dart';
import 'package:event_app/src/features/people_groups/widgets/people_group_card.dart';
import 'package:event_app/src/features/people_groups/pages/group_events_screen.dart';
import 'package:event_app/src/general_widgets/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/theme/colors.dart';
import '../../../general_widgets/spacing.dart';
import '../providers/groups_provider.dart';

class MyPeopleScreen extends ConsumerWidget {
  const MyPeopleScreen({super.key});
  static const routeName = '/my-people-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(groupsFutureProvider);
    // print(groupsAsync);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateGroup(),
                  ));
            },
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
        child: groupsAsync.when(
          data: (groups) => ListView.separated(
            separatorBuilder: (context, index) => const Spacing.mediumHeight(),
            itemBuilder: (context, index) => PeopleGroupCard(
              groupName: groups[index].title!,
              groupDescription: groups[index].description!,
              onTap: () {
                // todo: nav to the specific screen with dynamic data
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupEventsScreen(
                        groupId: groups[index].id ?? 'Dummy id',
                        groupTitle: groups[index].title ?? 'Dummy name',
                      ),
                    ));
              },
            ),
            itemCount: groups.length,
          ),
          error: (error, stackTrace) => const Center(
            child: Text('Error loading data'),
          ),
          loading: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}
