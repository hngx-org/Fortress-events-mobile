import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/app_enums.dart';
import 'package:event_app/src/features/auth/model/profile_details/create_account.dart';
import 'package:event_app/src/features/auth/notifiers/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this.apiServices) : super(UserState.initialState());
  final ApiServices apiServices;

  Future createAcc(CreateAccount account) async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final resp = await apiServices.createAccount(userData: account);
      debugLog('user data ${resp.toString()}');
      state = state.copyWith(
        loadState: LoadState.success,
        resp: resp,
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
}

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
  (_) => UserNotifier(_.read(apiServicesProvider)),
);
