import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/error/error.dart';
import 'package:posting_system/src/features/posts/data/models/request/post_body.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Error, PostEntity>> createPost(PostBody post);
  Future<Either<Error, List<PostEntity>>> getPosts();
  Future<Either<Error, PostEntity>> getPost(int id);
  Future<Either<Error, int>> updatePost(PostBody post);
  Future<Either<Error, int>> deletePost(int id);
}
