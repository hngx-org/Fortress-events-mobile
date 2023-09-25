import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/app_decoration.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/core/utils/theme/custom_text_style.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/features/auth/notifiers/user_notifier.dart';
import 'package:event_app/src/features/comment_screen/comment.dart';
import 'package:event_app/src/features/comment_screen/notifications_two.dart';
import 'package:event_app/src/features/groups/notiifiers/groups_notifiers.dart';
import 'package:event_app/src/general_widgets/custom_icon_and_text.dart';
import 'package:event_app/src/general_widgets/custom_text_button.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomEventsTile extends StatefulWidget {
  final String eventTitle;
  final String eventID;
  const CustomEventsTile(
      {super.key, required this.eventTitle, required this.eventID});

  @override
  State<CustomEventsTile> createState() => _CustomEventsTileState();
}

class _CustomEventsTileState extends State<CustomEventsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        // bottom: Dimensions.medium,
        top: Dimensions.medium,
        left: Dimensions.medium,
        right: Dimensions.medium,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.medium,
        vertical: Dimensions.medium,
      ),
      height: 148,
      width: 346,
      decoration: AppDecoration.fillWhiteA,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: 313,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // first details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 2,
                          color: appTheme.teal900,
                        ),
                        const SizedBox(
                          width: Dimensions.medium,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'May, 20, 2023',
                                  style: CustomTextStyles
                                      .bodySmallPlusJarkataSansTextGrey800,
                                ),
                                const SizedBox(
                                  width: Dimensions.small,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                  ),
                                  child: Icon(Icons.circle,
                                      size: Dimensions.tiny,
                                      color: appTheme.primary),
                                ),
                                const SizedBox(
                                  width: Dimensions.small,
                                ),
                                Text(
                                  'Fri, 4-6pm',
                                  style: CustomTextStyles
                                      .bodySmallPlusJarkataSansTextGrey800,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              widget.eventTitle,
                              style: CustomTextStyles.titleMediumGrey1000,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: Dimensions.bigSmall,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImageConstant.imgProfileAdd,
                      color: appTheme.gray800,
                    ),
                    const SizedBox(
                      width: Dimensions.bigSmall,
                    ),
                    SvgPicture.asset(
                      ImageConstant.imgMore,
                      color: appTheme.gray800,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Dimensions.medium,
          ),
          // second details
          Container(
            height: 50,
            width: 313,
            padding: const EdgeInsets.fromLTRB(
              Dimensions.medium,
              Dimensions.tiny,
              Dimensions.tiny,
              Dimensions.tiny,
            ),
            decoration: AppDecoration.fillGrey300,
            child: Row(
              children: [
                SizedBox(
                  height: Dimensions.biggerMedium,
                  width: 155,
                  child: Row(
                    children: [
                      CustomIconAndText(
                        iconColor: appTheme.red,
                        count: 30,
                        imagePath: ImageConstant.imgHeart,
                      ),
                      const SizedBox(
                        width: Dimensions.bigSmall,
                      ),
                      Container(
                        width: 1,
                        height: Dimensions.biggerMedium,
                        decoration: AppDecoration.fillGrey500,
                      ),
                      const SizedBox(
                        width: Dimensions.bigSmall,
                      ),
                      GestureDetector(
                        onTap: () => showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            context: context,
                            enableDrag: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0))),
                            builder: (context) => Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: const CommentScreen(),
                                )),
                        child: CustomIconAndText(
                          iconColor: appTheme.primary900,
                          count: 12,
                          imagePath: ImageConstant.imgMessage,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   width: Dimensions.bigSmall,
                // ),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    final notifier = ref.read(groupNotifierProvider.notifier);
                    final state = ref.watch(groupNotifierProvider);
                    final userState = ref.watch(userNotifierProvider);

                    return state.loadState == LoadState.success
                        ? Icon(
                            Icons.check,
                          )
                        : CustomTextButton(
                            buttonText: AppStrings.buttonText,
                            onPressed: () async {
                              //!Here
                              await notifier.indicateInterest(
                                  userId: userState.resp?.id ?? '',
                                  eventId: widget.eventID);
                              setState(() {});
                            },
                          );
                  },
                ),
                const Spacing.tinyWidth(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
