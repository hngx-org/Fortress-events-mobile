import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/features/calendar/widgets/calendar_widget.dart';
import 'package:event_app/src/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0XFFF2F4F7),
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.black),
        ),
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
          SizedBox(height: height * 0.9, child: CalendarTable())
        ],
      ),
    );
  }
}
