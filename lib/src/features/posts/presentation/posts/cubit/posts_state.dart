part of 'posts_cubit.dart';

enum ListStatus { loading, success, failure }

class PostsState extends Equatable {
  const PostsState._({
    this.status = ListStatus.loading,
    this.posts = const <PostEntity>[],
  });

  const PostsState.loading() : this._();

  const PostsState.success(List<PostEntity> posts)
      : this._(status: ListStatus.success, posts: posts);

  const PostsState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<PostEntity> posts;

  @override
  List<Object> get props => [status, posts];
}
