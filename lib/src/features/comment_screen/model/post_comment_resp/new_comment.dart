import 'dart:convert';

import 'package:equatable/equatable.dart';

class NewComment extends Equatable {
  final String? id;
  final String? body;
  final String? eventId;
  final String? userId;

  const NewComment({this.id, this.body, this.eventId, this.userId});

  factory NewComment.fromMap(Map<String, dynamic> data) => NewComment(
        id: data['id'] as String?,
        body: data['body'] as String?,
        eventId: data['event_id'] as String?,
        userId: data['user_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'body': body,
        'event_id': eventId,
        'user_id': userId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NewComment].
  factory NewComment.fromJson(String data) {
    return NewComment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NewComment] to a JSON string.
  String toJson() => json.encode(toMap());

  NewComment copyWith({
    String? id,
    String? body,
    String? eventId,
    String? userId,
  }) {
    return NewComment(
      id: id ?? this.id,
      body: body ?? this.body,
      eventId: eventId ?? this.eventId,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [id, body, eventId, userId];
}
