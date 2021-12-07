import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/error/error.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/posts/data/models/request/post_body.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';

class UpdatePostUsecase implements UseCase<int, PostBody> {
  final PostRepository repository;

  const UpdatePostUsecase({required this.repository});

  @override
  Future<Either<Error, int>> call(PostBody post) async {
    return await repository.updatePost(post);
  }
}
