import 'package:event_app/src/features/calendar/model/event_model/app_event.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';
import 'package:event_app/src/features/people_groups/services/group_events_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupEventsFutureProvider =
    FutureProvider.family<List<AppEvents>, String>((ref, id) async {
  final groupEventsApiService = ref.watch(groupEventsApiServiceProvider);
  return groupEventsApiService.getEvents(id);
});
