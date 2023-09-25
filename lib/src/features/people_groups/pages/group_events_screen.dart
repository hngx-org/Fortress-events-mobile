import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/custom_text_style.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/features/groups/notiifiers/groups_notifiers.dart';
import 'package:event_app/src/general_widgets/custom_events_tiles.dart';
import 'package:event_app/src/general_widgets/custom_navigator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_enums.dart';
import '../providers/group_events_provider.dart';

class GroupEventsScreen extends ConsumerWidget {
  final String groupId;
  final String? groupTitle;
  // final String? groupMembers;

  const GroupEventsScreen({
    super.key,
    required this.groupId,
    required this.groupTitle,
    // this.groupMembers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('groupId is $groupId');
    final groupEventsAsync = ref.watch(groupEventsFutureProvider(groupId));
    print('groupEventsAsync is $groupEventsAsync');
    return Scaffold(
      backgroundColor: appTheme.gray300,
      appBar: AppBar(
        backgroundColor: PrimaryColors().teal900,
        elevation: 0.0,
        leading: CustomNavigatorButton(
          iconColor: PrimaryColors().lightGreenA100,
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.medium),
            child: Icon(
              Icons.info_outline_rounded,
              size: Dimensions.biggerMedium,
              color: appTheme.whiteA700,
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main title
            Text(
              groupTitle!,
              style: CustomTextStyles.titleMediumWhiteA700Bold,
            ),
            // sub title
            Text(
              AppStrings.subTitle,
              style: CustomTextStyles.titlesmallBlueGrey400,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appTheme.primary1000,
        child: ColorFiltered(
          colorFilter:
              ColorFilter.mode(appTheme.lightGreenA100, BlendMode.srcIn),
          child: SvgPicture.asset(
            ImageConstant.imgProfileAdd,
            height: Dimensions.big,
            width: Dimensions.big,
          ),
        ),
      ),
      body: groupEventsAsync.when(
        data: (groupEvents) {
          print(groupEvents);
          return groupEvents.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: groupEvents.length,
                  itemBuilder: (context, index) {
                    final indexData = groupEvents[index];
                    return CustomEventsTile(
                      eventTitle: indexData.title ?? '',
                      eventID: indexData.id ?? '',
                    );
                  },
                )
              : const Center(
                  child: Text('No events found'),
                );
        },
        error: (error, stackTrace) => const Center(
          child: Text('Error loading data'),
        ),
        loading: () => const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
