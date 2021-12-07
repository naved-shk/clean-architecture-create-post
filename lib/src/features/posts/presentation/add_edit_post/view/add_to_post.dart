import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:posting_system/src/features/posts/presentation/add_edit_post/cubit/add_edit_post_cubit.dart';

class AddToPost extends StatelessWidget {
  const AddToPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Add to Post',
          style: Theme.of(context).textTheme.headline6,
        ),
        IconButton(
          icon: const Icon(Icons.image, color: Colors.green),
          onPressed: () async {
            XFile? xfile =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            if (xfile != null) {
              Uint8List? imageInBytes = await xfile.readAsBytes();
              context.read<AddEditPostCubit>().imageChanged(imageInBytes);
            }
          },
        )
      ],
    );
  }
}
