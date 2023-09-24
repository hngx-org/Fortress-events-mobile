import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/auth/model/profile_details/user.dart';

class UserState {
  final LoadState loadState;
  final String errorMessage;
  // final List<AppEvents>? resp;
  final User? resp;

  UserState({required this.loadState, this.errorMessage = '', this.resp});

  factory UserState.initialState() {
    return UserState(loadState: LoadState.idle, errorMessage: '', resp: null);
  }

  UserState copyWith({
    LoadState? loadState,
    User? resp,
    String? errorMessage,
  }) {
    return UserState(
        loadState: loadState ?? this.loadState,
        errorMessage: errorMessage ?? this.errorMessage,
        resp: resp ?? this.resp);
  }
}
