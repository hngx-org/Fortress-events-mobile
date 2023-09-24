import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'users.dart';

class MembersModel extends Equatable {
  final List<Member>? users;

  const MembersModel({this.users});

  factory MembersModel.fromMap(Map<String, dynamic> data) => MembersModel(
        users: (data['users'] as List<dynamic>?)
            ?.map((e) => Member.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'users': users?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MembersModel].
  factory MembersModel.fromJson(String data) {
    return MembersModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MembersModel] to a JSON string.
  String toJson() => json.encode(toMap());

  MembersModel copyWith({
    List<Member>? users,
  }) {
    return MembersModel(
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [users];
}
