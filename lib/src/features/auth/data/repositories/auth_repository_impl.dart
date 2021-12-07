import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/error/error.dart';
import 'package:posting_system/src/features/auth/data/data_sources/user_dao.dart';
import 'package:posting_system/src/features/auth/domain/entities/user_entity.dart';
import 'package:posting_system/src/features/auth/data/models/request/user_body.dart';
import 'package:posting_system/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserDAO userDAO;

  AuthRepositoryImpl({required this.userDAO});

  @override
  Future<Either<Error, UserEntity>> register(UserBody user) async {
    try {
      final localData = await userDAO.insertUser(user);
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "Exception $e"));
    }
  }

  @override
  Future<Either<Error, UserEntity>> login(UserBody user) async {
    try {
      final localData = await userDAO.checkUserLogin(user.email, user.password);
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "$e"));
    }
  }
}
