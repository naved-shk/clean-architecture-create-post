import 'package:posting_system/src/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';

class GetPostUsecase implements UseCase<PostEntity, int> {
  final PostRepository repository;

  const GetPostUsecase({required this.repository});

  @override
  Future<Either<Error, PostEntity>> call(int id) async {
    return await repository.getPost(id);
  }
}
