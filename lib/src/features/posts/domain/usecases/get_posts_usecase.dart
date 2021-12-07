import 'package:posting_system/src/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';

class GetPostsUsecase implements UseCase<List<PostEntity>, NoParams> {
  final PostRepository repository;

  const GetPostsUsecase({required this.repository});

  @override
  Future<Either<Error, List<PostEntity>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}
