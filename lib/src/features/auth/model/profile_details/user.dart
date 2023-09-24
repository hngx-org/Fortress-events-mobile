import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? avatar;

  const User({this.id = '717433fa-5ee2-484f-96dd-ca6b73fe6209', this.name, this.email, this.avatar});

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        avatar: data['avatar'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'avatar': avatar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, name, email, avatar];
}
