import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/features/posts/presentation/posts/cubit/posts_cubit.dart';
import 'package:posting_system/src/features/posts/presentation/posts/widgets/post_item_view.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorState) {
          return const Center(
            child: Text('Oops something went wrong!'),
          );
        } else if (state is LoadedState) {
          return PostItemView(posts: state.posts);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
