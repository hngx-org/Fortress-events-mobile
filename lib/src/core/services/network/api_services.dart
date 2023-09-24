import 'dart:convert';
import 'dart:io';
import 'package:event_app/src/core/services/base_constants/app_api_constants.dart';
import 'package:event_app/src/core/services/base_constants/failure.dart';
import 'package:event_app/src/core/services/base_constants/logger.dart';
import 'package:event_app/src/features/auth/model/user_model.dart';
import 'package:event_app/src/features/calendar/model/event_model/event_model.dart';
import 'package:event_app/src/features/calendar/model/sample_model/sample_model.dart';
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

  Future login() async {
    try {
      debugLog('Attemping to  sign up ');
      final response = await _get(
        uri:
            //  Uri.parse(              'http://ec2-18-119-101-235.us-east-2.compute.amazonaws.com:3000/auth/login/google')
            Uri(
          scheme: AppApiData.scheme,
          host: AppApiData.host,
          path: 'auth/login/google',
          port: 3000,
        ),
      );
      UserModel data = UserModel.fromJson(response.body);
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

  Future logout() async {
    try {
      final response = await _get(uri: AppApiData.baseUri('logout'));
      return response;
    } on SocketException catch (ex, stackTrace) {
      throw Failure(
          message: 'You don\'t have internet connection',
          devMessage: stackTrace.toString());
    } on Failure catch (ex, stackTrace) {
      throw Failure(
          message: 'Something went wrong, unable to logout',
          devMessage: 'Error:${ex}, stacktrace:: $stackTrace.toString()');
    }
  }
}

final apiServicesProvider = Provider((ref) => ApiServices());
