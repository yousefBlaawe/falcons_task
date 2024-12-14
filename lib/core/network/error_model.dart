import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;

  const ErrorMessageModel({
    required this.message,
  });

  factory ErrorMessageModel.fromJson(String message) =>
      ErrorMessageModel(
        message: message,
      );

  @override
  List<Object?> get props => [message];
}
