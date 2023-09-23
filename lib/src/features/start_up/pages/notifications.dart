import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/constants/strings.dart';
import 'package:event_app/src/core/utils/image_constant.dart';
import 'package:event_app/src/core/utils/theme/custom_text_style.dart';
import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:event_app/src/general_widgets/custom_events_tiles.dart';
import 'package:event_app/src/general_widgets/custom_navigator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstNotificationPage extends StatefulWidget {
  const FirstNotificationPage({super.key});

  @override
  State<FirstNotificationPage> createState() => _FirstNotificationPageState();
}

class _FirstNotificationPageState extends State<FirstNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray300,
      appBar: AppBar(
        backgroundColor: PrimaryColors().teal900,
        elevation: 0.0,
        leading: CustomNavigatorButton(
          iconColor: PrimaryColors().lightGreenA100,
          onPressed: () {
            Navigator.of(context).pop();
          },
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
              AppStrings.mainTitle,
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Events time
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.medium,
                  vertical: Dimensions.medium,
                ).copyWith(
                  bottom: Dimensions.small,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: Dimensions.small),
                  child: DropdownButton<String>(
                    value: AppStrings.selectedText,
                    items: AppStrings.events.map((String event) {
                      return DropdownMenuItem(
                        value: event,
                        child: Text(
                          event,
                          style: CustomTextStyles.titleMediumGrey1000,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? selected) {
                      setState(() {
                        AppStrings.selectedText = selected!;
                      });
                    },
                  ),
                ),
              ),
              // Events Tiles
              SizedBox(
                height: 812,
                width: 375,
                child: ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CustomEventsTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
