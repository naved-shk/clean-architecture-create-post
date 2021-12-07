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
      : super(const PostsState.loading());

  Future<void> getPosts() async {
    final eitherResponse = await getPostsUsecase.call(NoParams());

    emit(eitherResponse.fold((failure) {
      return const PostsState.failure();
    }, (success) {
      final posts = success;
      return PostsState.success(posts);
    }));
  }

  Future<void> deletePosts(int id) async {
    final deleteInProgress = state.posts.map((post) {
      return post.id == id ? post.copyWith(isDeleting: true) : post;
    }).toList();

    emit(PostsState.success(deleteInProgress));

    final eitherResponse = await deletePostUsecase.call(id);

    emit(eitherResponse.fold((failure) {
      return const PostsState.failure();
    }, (success) {
      final deleteSuccess = List.of(state.posts)
        ..removeWhere((element) => element.id == id);
      return PostsState.success(deleteSuccess);
    }));
  }
}
