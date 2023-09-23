import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';
import 'package:event_app/src/features/calendar/model/sample_model/sample_model.dart';
import 'package:event_app/src/features/calendar/notifiers/calendar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier(this.apiServices) : super(CalendarState.initialState());
  final ApiServices apiServices;

  Future getEvents() async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final EventModel sampleTest = await apiServices.getEvents();
      debugLog('Event data ${sampleTest.toString()}');
      state = state.copyWith(
        loadState: LoadState.success,
        resp: sampleTest,
      );
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
    } finally {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
  // Future sampleImpl() async {
  //   try {
  //     state = state.copyWith(loadState: LoadState.loading);
  //     final List<SampleModel> sampleTest = await apiServices.getSample();
  //     debugLog(
  //         'Data Gotten APi used as an api setup: First : ${sampleTest.first}');

  //     state = state.copyWith(
  //       loadState: LoadState.success,
  //       resp: sampleTest,
  //     );
  //   } catch (e) {
  //     state = state.copyWith(
  //       loadState: LoadState.error,
  //       errorMessage: e.toString(),
  //     );
  //   } finally {
  //     state = state.copyWith(loadState: LoadState.idle);
  //   }
  // }
}

final calendarNotifierProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>(
  (_) => CalendarNotifier(_.read(apiServicesProvider)),
);
