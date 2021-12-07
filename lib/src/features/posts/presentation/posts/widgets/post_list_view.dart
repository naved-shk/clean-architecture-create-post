import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/features/posts/presentation/posts/cubit/posts_cubit.dart';
import 'package:posting_system/src/features/posts/presentation/posts/widgets/post_item_view.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostsCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        return PostItemView(posts: state.posts);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
