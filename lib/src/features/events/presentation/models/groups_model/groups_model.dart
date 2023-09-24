import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'group.dart';

class GroupsModel extends Equatable {
  final List<Group>? groups;

  const GroupsModel({this.groups});

  factory GroupsModel.fromMap(Map<String, dynamic> data) => GroupsModel(
        groups: (data['groups'] as List<dynamic>?)
            ?.map((e) => Group.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'groups': groups?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GroupsModel].
  factory GroupsModel.fromJson(String data) {
    return GroupsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GroupsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  GroupsModel copyWith({
    List<Group>? groups,
  }) {
    return GroupsModel(
      groups: groups ?? this.groups,
    );
  }

  @override
  List<Object?> get props => [groups];
}
