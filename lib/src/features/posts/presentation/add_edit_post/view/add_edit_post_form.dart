import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:posting_system/src/config/theme/app_colors.dart';
import 'package:posting_system/src/core/utils/constants.dart';
import 'package:posting_system/src/features/posts/presentation/add_edit_post/cubit/add_edit_post_cubit.dart';
import 'package:posting_system/src/features/posts/presentation/add_edit_post/view/add_to_post.dart';

class AddEditPostForm extends StatelessWidget {
  final dynamic id;
  const AddEditPostForm({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEditPostCubit, AddEditPostState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                ),
              );
          } else if (state.status.isSubmissionSuccess) {
            context.read<AddEditPostCubit>().initialValue();
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(generalPadding16),
          child: Stack(
            children: [
              const SizedBox(height: double.infinity, child: _PostForm()),
              Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: generalPadding8),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const AddToPost(),
                ),
              )
            ],
          ),
        ));
  }
}

class _PostForm extends StatelessWidget {
  const _PostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _UserInfo(),
          const SizedBox(height: space16),
          _ContentTextFormField(),
          _Image(),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          flex: 2,
          child: _PublishButton(),
        )
      ],
    );
  }
}

class _PublishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditPostCubit, AddEditPostState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status.isValidated
              ? () => context.read<AddEditPostCubit>().createPost()
              : null,
          child: const Text(publish),
          style: ElevatedButton.styleFrom(
            onSurface: AppColor.purple,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
          ),
        );
      },
    );
  }
}

class _ContentTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditPostCubit, AddEditPostState>(
      buildWhen: (previous, current) =>
          previous.content.value != current.content.value,
      builder: (context, state) {
        return TextFormField(
          onChanged: (content) =>
              context.read<AddEditPostCubit>().contentChanged(content.trim()),
          maxLines: null,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Create a post...',
            hintStyle: Theme.of(context).textTheme.headline5,
          ),
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditPostCubit, AddEditPostState>(
      builder: (context, state) {
        return state.image.value != null
            ? Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: Image.memory(state.image.value!))
            : const SizedBox.shrink();
      },
    );
  }
}
