import 'package:event_app/src/core/constants/dimensions.dart';
import 'package:event_app/src/core/utils/date_time_utils.dart';
import 'package:event_app/src/features/calendar/data/calendar_utils.dart';
import 'package:event_app/src/general_widgets/app_text_field.dart';
import 'package:event_app/src/general_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatefulWidget {
  const CalendarTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarTableState createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  final _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          rowHeight: 45,
          availableGestures: AvailableGestures.all,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
            headerPadding: const EdgeInsets.all(Dimensions.zero),
            headerMargin:
                const EdgeInsets.symmetric(vertical: Dimensions.medium),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: _calendarFormat,
          rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          calendarStyle: const CalendarStyle(
            rangeHighlightColor: Color(0xFF063B27),
            rowDecoration: BoxDecoration(
              color: Colors.white,
            ),
            markersAutoAligned: true,
            selectedDecoration:
                BoxDecoration(color: Color(0xFF063B27), shape: BoxShape.circle),
            markerDecoration:
                BoxDecoration(color: Color(0xFF063B27), shape: BoxShape.circle),
            markerMargin: EdgeInsets.only(top: Dimensions.tiny),
          ),
          onDaySelected: _onDaySelected,
          daysOfWeekHeight: 42,
          daysOfWeekStyle: const DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.medium),
                topRight: Radius.circular(Dimensions.medium),
              ),
            ),
          ),
          onHeaderTapped: (focusedDay) {},
          //!Remove this when it has been confirmed that the feature is not needed
          // onDayLongPressed: (selectedDay, focusedDay) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => AlertDialog(
          //       scrollable: true,
          //       title: const Text('Add Events'),
          //       content: Column(
          //         children: [
          //           AppTextField(
          //             controller: _eventController,
          //           ),
          //         ],
          //       ),
          //       actions: [
          //         Padding(
          //           padding: const EdgeInsets.only(bottom: 12),
          //           child: CustomElevatedButton(
          //             height: 48,
          //             text: 'Submit',
          //             onTap: () {
          //               kEvents.addAll({
          //                 selectedDay: [
          //                   Event(
          //                       title: _eventController.text, date: selectedDay)
          //                 ]
          //               });
          //               Navigator.pop(context);
          //               _selectedEvents.value = _getEventsForDay(selectedDay);
          //               _eventController.clear();
          //             },
          //           ),
          //         )
          //       ],
          //     ),
          //   );
          // },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    padding: const EdgeInsets.all(Dimensions.small),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () => print('${value[index]}'),
                      title: Text(
                        value[index].date.format('d, MMMM y'),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.medium,
                            color: Color(0xFF1D2939)),
                      ),
                      subtitle: Text('${value[index]}'),
                      leading: Container(
                        height: 50,
                        width: 2,
                        color: const Color(0xFF063B27),
                      ),
                      trailing: const Column(
                        children: [
                          Icon(Icons.more_horiz_sharp),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: 89,
        ),
      ],
    );
  }
}
