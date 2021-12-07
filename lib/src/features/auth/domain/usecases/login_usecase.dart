import 'package:posting_system/src/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/auth/data/models/request/user_body.dart';
import 'package:posting_system/src/features/auth/domain/entities/user_entity.dart';
import 'package:posting_system/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<UserEntity, UserBody> {
  final AuthRepository repository;

  const LoginUsecase({required this.repository});

  @override
  Future<Either<Error, UserEntity>> call(UserBody user) async {
    return await repository.login(user);
  }
}
