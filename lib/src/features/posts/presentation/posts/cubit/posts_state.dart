part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class InitialState extends PostsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PostsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PostsState {
  const LoadedState(this.posts);

  final List<PostEntity> posts;

  @override
  List<Object> get props => [posts];
}

class DeleteInProgressState extends PostsState {
  @override
  List<Object> get props => [];
}

class ErrorState extends PostsState {
  @override
  List<Object> get props => [];
}
