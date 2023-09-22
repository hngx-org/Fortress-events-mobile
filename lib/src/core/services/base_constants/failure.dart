import 'package:equatable/equatable.dart';

///Failure model from network request to be created here
class Failure extends Equatable {
  final String message;
  final String devMessage;

  Failure({
    required this.message,
    required this.devMessage,
  });

  @override
  List<Object?> get props => [message, devMessage];
}
