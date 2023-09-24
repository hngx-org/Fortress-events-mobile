import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateAccount extends Equatable {
  final String? email;
  final String? displayName;
  final String? photoUrl;

  const CreateAccount({this.email, this.displayName, this.photoUrl});

  factory CreateAccount.fromMap(Map<String, dynamic> data) => CreateAccount(
        email: data['email'] as String?,
        displayName: data['displayName'] as String?,
        photoUrl: data['photoUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'displayName': displayName,
        'photoUrl': photoUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateAccount].
  factory CreateAccount.fromJson(String data) {
    return CreateAccount.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateAccount] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateAccount copyWith({
    String? email,
    String? displayName,
    String? photoUrl,
  }) {
    return CreateAccount(
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [email, displayName, photoUrl];
}
