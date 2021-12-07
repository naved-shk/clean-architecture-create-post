import 'package:posting_system/src/features/auth/domain/entities/user_entity.dart';

const String tableNameUser = 'users';

class UserFields {
  static const List<String> values = [id, fullName, email, time];

  static const String id = '_id';
  static const String fullName = 'full_name';
  static const String email = 'email';
  static const String password = 'password';
  static const String time = 'time';

  static String create() {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    return '''CREATE TABLE $tableNameUser(
      $id $idType ,
      $fullName $textType,
      $email $textType,
      $password $textType,
      $time $textType
      )''';
  }
}

class UserModel extends UserEntity {
  const UserModel(
      {int? id,
      required fullName,
      required email,
      required bool success,
      required String message,
      required DateTime createdTime})
      : super(
            id: id,
            fullName: fullName,
            email: email,
            success: success,
            message: message,
            createdTime: createdTime);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json[UserFields.id] as int?,
      fullName: json[UserFields.fullName] as String,
      email: json[UserFields.email] as String,
      createdTime: DateTime.parse(json[UserFields.time] as String),
      success: json['success'],
      message: json['message']);
}
