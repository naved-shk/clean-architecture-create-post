import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/error/error.dart';
import 'package:posting_system/src/features/auth/data/models/request/user_body.dart';
import 'package:posting_system/src/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Error, UserEntity>> register(UserBody user);
  Future<Either<Error, UserEntity>> login(UserBody user);
}
