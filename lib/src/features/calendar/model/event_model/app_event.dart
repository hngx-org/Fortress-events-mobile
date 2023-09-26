import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppEvents extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? location;
  final String? creatorId;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final int? usersInterested;

  const AppEvents({
    this.id,
    this.title,
    this.description,
    this.location,
    this.creatorId,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.usersInterested,
  });

  factory AppEvents.fromMap(Map<String, dynamic> data) => AppEvents(
        id: data['id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        location: data['location'] as String?,
        creatorId: data['creator_id'] as String?,
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        startTime: data['start_time'] as String?,
        endTime: data['end_time'] as String?,
        usersInterested: data['interested_users'].length as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'location': location,
        'creator_id': creatorId,
        'start_date': startDate,
        'end_date': endDate,
        'start_time': startTime,
        'end_time': endTime,
        'interested_users': usersInterested,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppEvents].
  factory AppEvents.fromJson(String data) {
    return AppEvents.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AppEvents] to a JSON string.
  String toJson() => json.encode(toMap());

  AppEvents copyWith({
    String? id,
    String? title,
    String? description,
    String? location,
    String? creatorId,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    int? usersInterested,

  }) {
    return AppEvents(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      creatorId: creatorId ?? this.creatorId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      usersInterested: usersInterested ?? this.usersInterested,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      location,
      creatorId,
      startDate,
      endDate,
      startTime,
      endTime,
      usersInterested,
    ];
  }
}
