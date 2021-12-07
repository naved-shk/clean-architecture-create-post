import 'package:equatable/equatable.dart';
import 'package:posting_system/src/features/auth/data/models/response/user_model.dart';

class UserBody extends Equatable {
  final String? id;
  final String? fullName;
  final String email;
  final String password;
  final DateTime? createdTime;

  const UserBody(
      {this.id,
      this.fullName,
      required this.email,
      required this.password,
      this.createdTime});

  @override
  List<Object?> get props => [id, fullName, email, password, createdTime];

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.fullName: fullName,
        UserFields.email: email,
        UserFields.password: password,
        UserFields.time: createdTime!.toIso8601String()
      };
}
