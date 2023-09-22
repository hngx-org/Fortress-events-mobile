import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/theme/colors.dart';
import 'package:event_app/src/features/calendar/notifiers/calendar_notifier.dart';
import 'package:event_app/src/features/calendar/widgets/calendar_widget.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/utils/theme/text_styles.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});
  static const routeName = '/calendar-screen';

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final data =
          await ref.read(calendarNotifierProvider.notifier).sampleImpl();
      print('Data feteched==> $data');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.gray300,
      appBar: AppBar(
        title: Text('Calendar',
            style: AppTextStyles.textMdBold
                .copyWith(color: const Color(0xFF1D2939))),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:
          // CalendarTable()
          ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            left: Dimensions.medium,
            right: Dimensions.medium,
            top: Dimensions.medium),
        children: [
          const Spacing.smallHeight(),
          SizedBox(height: height * 0.9, child: const CalendarTable())
        ],
      ),
    );
  }
}
