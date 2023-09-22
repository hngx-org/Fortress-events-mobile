import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/calendar/model/sample_model/sample_model.dart';

class CalendarState {
  final LoadState loadState;
  final String errorMessage;
  final List<SampleModel>? resp;

  CalendarState({required this.loadState, this.errorMessage = '', this.resp});

  factory CalendarState.initialState() {
    return CalendarState(
        loadState: LoadState.idle, errorMessage: '', resp:null);
  }

  CalendarState copyWith({
    LoadState? loadState,
    List<SampleModel>? resp,
    String? errorMessage,
  }) {
    return CalendarState(
        loadState: loadState ?? this.loadState,
        errorMessage: errorMessage ?? this.errorMessage,
        resp: resp ?? this.resp);
  }
}
