import 'dart:convert';
import 'dart:io';
import 'package:event_app/src/core/services/base_constants/app_api_constants.dart';
import 'package:event_app/src/core/services/base_constants/failure.dart';
import 'package:event_app/src/core/services/base_constants/logger.dart';
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

  Future getSample() async {
    try {
      debugLog('Attemping to get smaple list');
      final response = await _get(uri: AppApiData.baseUri);
      List<SampleModel> data = List<SampleModel>.from(
        //!todo: check here
              jsonDecode(response.body).map((x) => SampleModel.fromJson(x)))
          .toList();

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
