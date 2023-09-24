import 'dart:convert';

import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String? id;
  final String? title;

  const Group({this.id, this.title});

  factory Group.fromMap(Map<String, dynamic> data) => Group(
        id: data['id'] as String?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Group].
  factory Group.fromJson(String data) {
    return Group.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Group] to a JSON string.
  String toJson() => json.encode(toMap());

  Group copyWith({
    String? id,
    String? title,
  }) {
    return Group(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [id, title];
}
