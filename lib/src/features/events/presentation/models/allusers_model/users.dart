import 'dart:convert';

import 'package:equatable/equatable.dart';

class Member extends Equatable{
  final String? id;
  final String? name;

  const Member({this.id, this.name});

  factory Member.fromMap(Map<String, dynamic> data) => Member(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
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
  }) {
    return Member(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
