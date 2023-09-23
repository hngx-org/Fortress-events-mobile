import 'dart:convert';

import 'package:equatable/equatable.dart';

class SampleModel extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const SampleModel({this.userId, this.id, this.title, this.body});

  factory SampleModel.fromMap(Map<String, dynamic> data) => SampleModel(
        userId: data['userId'] as int?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        body: data['body'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SampleModel].
  factory SampleModel.fromJson(String data) {
    return SampleModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SampleModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SampleModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return SampleModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
