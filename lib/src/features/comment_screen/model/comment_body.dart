import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommentBody extends Equatable {
  final String? body;
  final String? eventId;
  final String? userId;
  final String? url;

  const CommentBody({this.body, this.eventId, this.userId, this.url});

  factory CommentBody.fromMap(Map<String, dynamic> data) => CommentBody(
        body: data['body'] as String?,
        eventId: data['event_id'] as String?,
        userId: data['user_id'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'body': body,
        'event_id': eventId,
        'user_id': userId,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommentBody].
  factory CommentBody.fromJson(String data) {
    return CommentBody.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommentBody] to a JSON string.
  String toJson() => json.encode(toMap());

  CommentBody copyWith({
    String? body,
    String? eventId,
    String? userId,
    String? url,
  }) {
    return CommentBody(
      body: body ?? this.body,
      eventId: eventId ?? this.eventId,
      userId: userId ?? this.userId,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [body, eventId, userId, url];
}
