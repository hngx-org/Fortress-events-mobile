import 'package:event_app/src/core/utils/app_enums.dart';

class GroupState {
  final LoadState loadState;
  final String errorMessage;

  GroupState({
    required this.loadState,
    this.errorMessage = '',
  });

  factory GroupState.initialState() {
    return GroupState(
      loadState: LoadState.idle,
      errorMessage: '',
    );
  }

  GroupState copyWith({
    LoadState? loadState,
    String? errorMessage,
  }) {
    return GroupState(
      loadState: loadState ?? this.loadState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
