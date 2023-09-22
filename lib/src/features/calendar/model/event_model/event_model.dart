import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class EventModel extends Equatable {
  final List<Datum>? data;

  const EventModel({this.data});

  factory EventModel.fromMap(Map<String, dynamic> data) => EventModel(
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EventModel].
  factory EventModel.fromJson(String data) {
    return EventModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EventModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EventModel copyWith({
    List<Datum>? data,
  }) {
    return EventModel(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data];
}
