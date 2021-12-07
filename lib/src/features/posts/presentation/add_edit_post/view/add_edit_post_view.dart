import 'package:flutter/material.dart';
import 'package:posting_system/src/features/posts/presentation/add_edit_post/view/add_edit_post_form.dart';

class AddEditPostView extends StatelessWidget {
  final dynamic id;
  const AddEditPostView({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AddEditPostForm(),
      ),
    );
  }
}
