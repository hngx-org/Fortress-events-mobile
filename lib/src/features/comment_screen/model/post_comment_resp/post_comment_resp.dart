import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'new_comment.dart';

class PostCommentResp extends Equatable {
  final String? message;
  final NewComment? newComment;

  const PostCommentResp({this.message, this.newComment});

  factory PostCommentResp.fromMap(Map<String, dynamic> data) {
    return PostCommentResp(
      message: data['message'] as String?,
      newComment: data['newComment'] == null
          ? null
          : NewComment.fromMap(data['newComment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'newComment': newComment?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostCommentResp].
  factory PostCommentResp.fromJson(String data) {
    return PostCommentResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostCommentResp] to a JSON string.
  String toJson() => json.encode(toMap());

  PostCommentResp copyWith({
    String? message,
    NewComment? newComment,
  }) {
    return PostCommentResp(
      message: message ?? this.message,
      newComment: newComment ?? this.newComment,
    );
  }

  @override
  List<Object?> get props => [message, newComment];
}
