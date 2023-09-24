import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/group_model.dart';
import '../services/groups_api_service.dart';

final groupsFutureProvider = FutureProvider<List<GroupModel>>((ref) async {
  final groupsApiService = ref.watch(groupsApiServiceProvider);
  return groupsApiService.getGroups();
});
