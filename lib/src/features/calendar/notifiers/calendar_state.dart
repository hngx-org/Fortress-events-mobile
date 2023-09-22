import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';



import '../model/event_model/app_event.dart';

class CalendarState {
  final LoadState loadState;
  final String errorMessage;
  // final List<AppEvents>? resp;
  final EventModel? resp;

  CalendarState({required this.loadState, this.errorMessage = '', this.resp});


  factory CalendarState.initialState() {
    return CalendarState(
        loadState: LoadState.idle, errorMessage: '', resp: null);
  }

  CalendarState copyWith({
    LoadState? loadState,
    EventModel? resp, 
    // List<AppEvents>? resp, 
    String? errorMessage,
  }) {
    return CalendarState(
        loadState: loadState ?? this.loadState,
        errorMessage: errorMessage ?? this.errorMessage,
        resp: resp ?? this.resp);
  }
}
