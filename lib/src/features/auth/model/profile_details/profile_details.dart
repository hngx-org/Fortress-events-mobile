import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class ProfileDetails extends Equatable {
  final List<User>? users;

  const ProfileDetails({this.users});

  factory ProfileDetails.fromMap(Map<String, dynamic> data) {
    return ProfileDetails(
      users: (data['users'] as List<dynamic>?)
          ?.map((e) => User.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'users': users?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileDetails].
  factory ProfileDetails.fromJson(String data) {
    return ProfileDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [users];
}
