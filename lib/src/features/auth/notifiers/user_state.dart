import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/auth/model/user_model.dart';




class UserState {
  final LoadState loadState;
  final String errorMessage;
  // final List<AppEvents>? resp;
  final UserModel? resp;

  UserState({required this.loadState, this.errorMessage = '', this.resp});

  factory UserState.initialState() {
    return UserState(
        loadState: LoadState.idle, errorMessage: '', resp: null);
  }

  UserState copyWith({
    LoadState? loadState,
    UserModel? resp,
    String? errorMessage,
  }) {
    return UserState(
        loadState: loadState ?? this.loadState,
        errorMessage: errorMessage ?? this.errorMessage,
        resp: resp ?? this.resp);
  }
}
