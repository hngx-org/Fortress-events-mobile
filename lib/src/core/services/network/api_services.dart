import 'dart:convert';
import 'dart:io';
import 'package:event_app/src/core/services/base_constants/app_api_constants.dart';
import 'package:event_app/src/core/services/base_constants/failure.dart';
import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/features/auth/model/profile_details/create_account.dart';
import 'package:event_app/src/features/auth/model/profile_details/profile_details.dart';
import 'package:event_app/src/features/auth/model/profile_details/user.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';
import 'package:event_app/src/features/events/presentation/models/groups_model/groups_model.dart';
// import 'package:event_app/src/features/settings_screen/widgets/make_a_wish_4_screen.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiServices {
  Future<http.Response> _post(
      {required Map<String, dynamic> data, required Uri uri}) async {
    debugLog('Making a post request to $uri');
    http.Response response = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    debugLog('Response returned => ${response.body}');
    return response;
  }

  Future<http.Response> _get({required Uri uri}) async {
    debugLog('Making a get request to $uri');
    final http.Response response = await http.get(uri);
    debugLog('Response returned => ${response.body}');
    return response;
  }

  // Future getSample() async {
  //   try {
  //     debugLog('Attemping to get smaple list');
  //     final response = await _get(uri: AppApiData.baseUri);
  //     List<SampleModel> data = List<SampleModel>.from(
  //             jsonDecode(response.body).map((x) => SampleModel.fromMap(x)))
  //         .toList();

  //     return data;
  //   } on SocketException catch (ex, stackTrace) {
  //     throw Failure(
  //         message: 'You don\'t have internet connection',
  //         devMessage: stackTrace.toString());
  //   } on FormatException {
  //     throw Failure(
  //       message: 'Username or password is incorrect',
  //       devMessage: 'Error at formatException',
  //     );
  //   } on Failure catch (ex, stackTrace) {
  //     throw Failure(
  //         message: ex.message,
  //         devMessage: 'Error:${ex}, Stacktrace: $stackTrace');
  //   }
  // }

  Future getEvents() async {
    try {
      debugLog('Attemping to get event list');
      final response = await _get(uri: AppApiData.baseUri('events'));
      EventModel data = EventModel.fromJson(response.body);
      return data;
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } on FormatException {
      throw Failure(
        message: 'Username or password is incorrect',
        devMessage: 'Error at formatException',
      );
    } on Failure catch (ex, stackTrace) {
      throw Failure(
          message: ex.message,
          devMessage: 'Error:${ex}, Stacktrace: $stackTrace');
    }
  }

  Future createAccount({required CreateAccount userData}) async {
    try {
      debugLog('Attemping to get creating acc');
      final response = await _post(
          data: userData.toMap(), uri: AppApiData.baseUri('users/'));
      final data = User.fromJson(response.body);
      return data;
    } on SocketException catch (ex, stackTrace) {
      debugLog('Socket Exception Error => ${ex.toString()}');
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } on FormatException {
      throw Failure(
        message: 'Username or password is incorrect',
        devMessage: 'Error at formatException',
      );
    } on Failure catch (ex, stackTrace) {
      throw Failure(
          message: ex.message,
          devMessage: 'Error:${ex}, Stacktrace: $stackTrace');
    }
  }

  Future getAllUsers() async {
    try {
      debugLog('Attemping to get creating acc');
      final response = await _get(uri: AppApiData.baseUri('users/'));
      final data = ProfileDetails.fromJson(response.body);
      return data;
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } on FormatException {
      throw Failure(
        message: 'Username or password is incorrect',
        devMessage: 'Error at formatException',
      );
    } on Failure catch (ex, stackTrace) {
      throw Failure(
          message: ex.message,
          devMessage: 'Error:${ex}, Stacktrace: $stackTrace');
    }
  }

  Future getAllGroups() async {
    try {
      debugLog('Attemping to get all groups');
      final response = await _get(uri: AppApiData.baseUri('groups'));
      final data = GroupsModel.fromJson(response.body);
      return data;
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } on FormatException {
      throw Failure(
        message: 'Username or password is incorrect',
        devMessage: 'Error at formatException',
      );
    } on Failure catch (ex, stackTrace) {
      throw Failure(
          message: ex.message,
          devMessage: 'Error:${ex}, Stacktrace: $stackTrace');
    }
  }
}

final apiServicesProvider = Provider((ref) => ApiServices());
