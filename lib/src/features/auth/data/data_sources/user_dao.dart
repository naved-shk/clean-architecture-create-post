import 'package:posting_system/src/features/auth/data/models/request/user_body.dart';
import 'package:posting_system/src/features/auth/data/models/response/user_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/db/app_database.dart';

class UserDAO {
  Database? _db;

  UserDAO() {
    _getDbInstance();
  }

  void _getDbInstance() async => _db = await AppDatabase.instance.database;

  Future<UserModel> insertUser(UserBody user) async {
    final id = await _db!.insert(tableNameUser, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return UserModel(
        success: true,
        message: "User Registerd Successfully",
        id: id,
        fullName: user.fullName,
        email: user.email,
        createdTime: user.createdTime!);
  }

  Future<dynamic> checkUserLogin(String email, String password) async {
    final maps = await _db!.query(
      tableNameUser,
      columns: UserFields.values,
      where: "${UserFields.email} = ? AND ${UserFields.password} = ?",
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      final userMap = Map.of(maps.first);
      userMap['success'] = true;
      userMap['message'] = 'Successfully login';

      return UserModel.fromJson(userMap);
    } else {
      return throw Exception('Invalid Credentinals');
    }
  }

  Future close() async => _db!.close();
}
