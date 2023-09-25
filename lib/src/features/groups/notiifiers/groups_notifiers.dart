import 'dart:convert';

import 'package:event_app/src/core/helper_fxn.dart';
import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/core/services/network/api_services.dart';
import 'package:event_app/src/core/utils/app_enums.dart';

import 'package:event_app/src/features/groups/notiifiers/groups_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class GroupNotifier extends StateNotifier<GroupState> {
  GroupNotifier(this.apiServices) : super(GroupState.initialState());
  final ApiServices apiServices;

  Future indicateInterest(
      {required String userId, required String eventId}) async {
    try {
      state = state.copyWith(loadState: LoadState.loading);
      final Response resp =
          await apiServices.indicateInterest(userID: userId, eventID: eventId);

      final data = jsonDecode(resp.body);
      debugLog(' data => $data');
      if (resp.statusCode == 201) {
        debugLog('In success');
        debugLog('data resp: ${data['message']}');

        ///!success
        toastMessage('Interest created', long: true);
        state = state.copyWith(
            loadState: LoadState.success, errorMessage: data['message']);
      } else {
        errorToastMessage(data['message']);
        state = state.copyWith(
            loadState: LoadState.error, errorMessage: data['message']);
      }
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

final groupNotifierProvider = StateNotifierProvider<GroupNotifier, GroupState>(
  (_) => GroupNotifier(_.read(apiServicesProvider)),
);
