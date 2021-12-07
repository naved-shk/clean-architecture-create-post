import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/core/utils/constants.dart';
import 'package:posting_system/src/features/posts/domain/entities/post_entity.dart';
import 'package:posting_system/src/features/posts/presentation/posts/cubit/posts_cubit.dart';

class PostItemView extends StatelessWidget {
  final List<PostEntity> posts;
  const PostItemView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? const Center(child: Text('No post found'))
        : ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ItemTile(
                post: posts[index],
                onDeletePressed: (id) {
                  context.read<PostsCubit>().deletePosts(int.parse(id));
                },
              );
            });
  }
}

class ItemTile extends StatelessWidget {
  final PostEntity post;
  final ValueSetter<String> onDeletePressed;

  const ItemTile({
    Key? key,
    required this.post,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UserInfo(time: DateFormat.Hm().format(post.createdTime)),
          _Content(
            content: post.content,
          ),
          _Image(
            image: post.image,
          ),
          _DeleteButton(post: post, onDeletePressed: onDeletePressed),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String time;

  const _UserInfo({Key? key, required this.time}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: generalPadding16),
      child: Row(
        children: [
          const Expanded(
              flex: 1,
              child: ClipOval(
                child: Icon(Icons.person_rounded),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Aman Shaikh",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Expanded(flex: 1, child: Text(time)),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String content;
  const _Content({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(generalPadding16),
      child: Text(
        content,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final PostEntity post;
  final ValueSetter<String> onDeletePressed;
  const _DeleteButton(
      {Key? key, required this.post, required this.onDeletePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(generalMargin8),
      alignment: Alignment.bottomRight,
      child: post.isDeleting
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDeletePressed(post.id.toString()),
            ),
    );
  }
}

class _Image extends StatelessWidget {
  final Uint8List? image;

  const _Image({Key? key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return image != null
        ? Container(alignment: Alignment.center, child: Image.memory(image!))
        : const SizedBox.shrink();
  }
}
