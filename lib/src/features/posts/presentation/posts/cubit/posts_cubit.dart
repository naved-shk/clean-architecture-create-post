import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posting_system/src/core/usecases/usecase.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';
import 'package:posting_system/src/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:posting_system/src/features/posts/domain/usecases/get_posts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUsecase getPostsUsecase;
  final DeletePostUsecase deletePostUsecase;
  PostsCubit({required this.getPostsUsecase, required this.deletePostUsecase})
      : super(InitialState()) {
    getPosts();
  }

  Future<void> getPosts() async {
    emit(LoadingState());
    final eitherResponse = await getPostsUsecase.call(NoParams());

    emit(eitherResponse.fold((failure) {
      return ErrorState();
    }, (success) {
      final posts = success;
      return LoadedState(posts);
    }));
  }

  Future<void> deletePosts(int id, List<PostEntity> posts) async {
    emit(DeleteInProgressState());

    final eitherResponse = await deletePostUsecase.call(id);

    emit(eitherResponse.fold((failure) {
      return ErrorState();
    }, (success) {
      final List<PostEntity> result = List.of(posts)
        ..removeWhere((element) => element.id == id);
      return LoadedState(result);
    }));
  }
}
