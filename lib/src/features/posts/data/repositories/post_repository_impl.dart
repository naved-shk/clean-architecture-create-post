import 'package:dartz/dartz.dart';
import 'package:posting_system/src/features/posts/data/data_source/post_dao.dart';
import 'package:posting_system/src/features/posts/data/models/request/post_body.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';
import 'package:posting_system/src/core/error/error.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDAO postDAO;

  PostRepositoryImpl({required this.postDAO});

  @override
  Future<Either<Error, List<PostEntity>>> getPosts() async {
    try {
      final localData = await postDAO.getPosts();
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "Exception $e"));
    }
  }

  @override
  Future<Either<Error, PostEntity>> createPost(PostBody post) async {
    try {
      final localData = await postDAO.createPost(post);
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "Exception $e"));
    }
  }

  @override
  Future<Either<Error, int>> deletePost(int id) async {
    try {
      final localData = await postDAO.deletePost(id);
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "Exception $e"));
    }
  }

  @override
  Future<Either<Error, PostEntity>> getPost(int id) async {
    try {
      final localData = await postDAO.getPost(id);
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "Exception $e"));
    }
  }

  @override
  Future<Either<Error, int>> updatePost(PostBody post) async {
    try {
      final localData = await postDAO.updatePost(post);
      return Right(localData);
    } on Exception catch (e) {
      return Left(Error(message: "Exception $e"));
    }
  }
}
