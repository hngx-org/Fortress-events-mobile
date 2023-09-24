import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/services/base_constants/app_api_constants.dart';
import '../../../core/services/base_constants/logger.dart';
import '../models/group_model.dart';

class GroupsApiService {
  Future<List<GroupModel>> getGroups() async {
    debugLog('Attemping to get group list');
    final response = await http.get(
      AppApiData.baseUri('groups'),
    );
    // print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['groups'];
      // print('The result is $result');
      final resultList = result.map((e) => GroupModel.fromJson(e)).toList();
      // print(resultList);
      return resultList;
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}

final groupsApiServiceProvider = Provider<GroupsApiService>((ref) {
  return GroupsApiService();
});
