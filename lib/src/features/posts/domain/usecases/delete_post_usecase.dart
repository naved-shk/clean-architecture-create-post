import 'package:posting_system/src/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';

class DeletePostUsecase implements UseCase<int, int> {
  final PostRepository repository;

  const DeletePostUsecase({required this.repository});

  @override
  Future<Either<Error, int>> call(int id) async {
    return await repository.deletePost(id);
  }
}
