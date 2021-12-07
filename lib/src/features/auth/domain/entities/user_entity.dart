import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String fullName;
  final String email;
  final bool success;
  final String message;
  final DateTime createdTime;

  const UserEntity(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.success,
      required this.message,
      required this.createdTime});

  @override
  List<Object?> get props =>
      [id, fullName, email, success, message, createdTime];
}
