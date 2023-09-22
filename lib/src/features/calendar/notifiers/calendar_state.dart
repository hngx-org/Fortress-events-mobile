import 'package:event_app/src/core/utils/app_enums.dart';

class CalendarState {
  final LoadState loadState;
  final String errorMessage;

  CalendarState({
    required this.loadState,
    this.errorMessage = '',
  });

  factory CalendarState.initialState() {
    return CalendarState(
      loadState: LoadState.idle,
      errorMessage: '',
    );
  }

  CalendarState copyWith(
      {LoadState? loadState,
      LoadState? resendOTPloadState,
      String? email,
      String? errorMessage,
      bool? agreeToTerms}) {
    return CalendarState(
        loadState: loadState ?? this.loadState,      
        errorMessage: errorMessage ?? this.errorMessage,
      );
  }
}
