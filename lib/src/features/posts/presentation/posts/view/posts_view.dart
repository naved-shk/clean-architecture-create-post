import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/config/routes/app_routes.dart';
import 'package:posting_system/src/core/di/injection_container.dart';
import 'package:posting_system/src/features/posts/presentation/posts/cubit/posts_cubit.dart';
import 'package:posting_system/src/features/posts/presentation/posts/widgets/post_list_view.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) => sl<PostsCubit>(),
      child: Scaffold(
        floatingActionButton: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(AppRoutes.postAddEdit)
                  .then((value) {
                context.read<PostsCubit>().getPosts();
              }),
              tooltip: "Add",
              child: const Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(title: const Text("Social App")),
        body: const PostListView(),
      ),
    );
  }
}
