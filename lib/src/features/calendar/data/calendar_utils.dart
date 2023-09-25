import 'dart:collection';
import 'dart:core';
import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 6, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 6, kToday.day);

/// Example event class.
class Event {
  final String title;
  final DateTime date;

  const Event({required this.date, required this.title});

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);
final Map<DateTime, List<Event>> _kEventSource = {};
// final _kEventSource = {
//   for (var item in List.generate(50, (index) => index))
//     DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
//         item % 4 + 1,
//         (index) =>
//             Event(title: 'Event $item | ${index + 1}', date: DateTime.now()))
// }..addAll({
//     kToday: [
//       Event(title: 'Today\'s Event 1', date: DateTime.now()),
//       Event(title: 'Today\'s Event 2', date: DateTime.now()),
//     ],
//   });
int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

void populateEventsFromApi(EventModel eventModel) {
  if (eventModel.data != null) {
    for (final event in eventModel.data!) {
      final eventDate = DateTime.parse(
          event.startDate ?? ''); // Assuming startDate is in ISO 8601 format
      if (_kEventSource.containsKey(eventDate)) {
        _kEventSource[eventDate]!.add(
          Event(title: event.title!, date: eventDate),
        );
      } else {
        _kEventSource[eventDate] = [
          Event(title: event.title!, date: eventDate),
        ];
      }
    }
  }
}
