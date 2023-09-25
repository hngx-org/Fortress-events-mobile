import 'dart:convert';

import 'package:equatable/equatable.dart';

class Member extends Equatable{
  final String? id;
  final String? name;
  final String? email;
  final String? avatar;

  const Member({this.id, this.name, this.email, this.avatar});

  factory Member.fromMap(Map<String, dynamic> data) => Member(
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
  /// Parses the string and returns the resulting Json object as [Member].
  factory Member.fromJson(String data) {
    return Member.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Member] to a JSON string.
  String toJson() => json.encode(toMap());

  Member copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
  }) {
    return Member(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [id, name, email, avatar];
}
