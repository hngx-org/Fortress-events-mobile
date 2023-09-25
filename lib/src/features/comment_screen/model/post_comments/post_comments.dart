import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostComments extends Equatable {
  final String? id;
  final String? body;
  final String? imageUrl;
  final String? user;
  final String? avatar;

  const PostComments(
      {this.id, this.body, this.imageUrl, this.avatar, this.user});

  factory PostComments.fromMap(Map<String, dynamic> data) => PostComments(
        id: data['id'] as String?,
        body: data['body'] as String?,
        imageUrl: data['imageUrl'] as String?,
        avatar: data['avatar'] as String?,
        user: data['user'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'body': body,
        'imageUrl': imageUrl,
        'avatar': avatar,
        'user': user
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostComments].
  factory PostComments.fromJson(String data) {
    return PostComments.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostComments] to a JSON string.
  String toJson() => json.encode(toMap());

  PostComments copyWith({
    String? id,
    String? body,
    String? imageUrl,
    String? avatar,
    String? user,
  }) {
    return PostComments(
      id: id ?? this.id,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      user: user ?? this.user,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [id, body, imageUrl, user, avatar];
}
