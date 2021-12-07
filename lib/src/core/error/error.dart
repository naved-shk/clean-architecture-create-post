import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final String message;
  final int? statusCode;

  const Error({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
