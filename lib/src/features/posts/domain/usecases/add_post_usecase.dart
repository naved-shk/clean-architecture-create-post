import 'package:posting_system/src/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/posts/data/models/request/post_body.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';

class AddPostUsecase implements UseCase<PostEntity, PostBody> {
  final PostRepository repository;

  const AddPostUsecase({required this.repository});

  @override
  Future<Either<Error, PostEntity>> call(PostBody post) async {
    return await repository.createPost(post);
  }
}
