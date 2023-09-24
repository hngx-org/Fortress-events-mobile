import 'package:event_app/src/features/calendar/model/event_model/app_event.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/base_constants/app_api_constants.dart';
import '../../../core/services/base_constants/logger.dart';

class GroupEventsApiService {
  GroupEventsApiService();

  Future<List<AppEvents>> getEvents(String id) async {
    debugLog('Attemping to get group list');

    final response = await http.get(
      AppApiData.baseUri('events'),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final result = EventModel.fromJson(response.body).data?.toList();
      print('The result of the GroupEventsApiService is $result');
      return result ?? [];
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}

final groupEventsApiServiceProvider = Provider<GroupEventsApiService>((ref) {
  return GroupEventsApiService();
});
