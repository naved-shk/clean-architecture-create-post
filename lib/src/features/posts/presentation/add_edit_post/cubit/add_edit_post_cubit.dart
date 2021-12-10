import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:posting_system/src/features/posts/data/models/request/post_body.dart';
import 'package:posting_system/src/features/posts/data/models/validation/content.dart';
import 'package:posting_system/src/features/posts/data/models/validation/image.dart';
import 'package:posting_system/src/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:posting_system/src/features/posts/domain/usecases/update_post_usecase.dart';

part 'add_edit_post_state.dart';

class AddEditPostCubit extends Cubit<AddEditPostState> {
  final AddPostUsecase addPostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  AddEditPostCubit(
      {required this.addPostUsecase, required this.updatePostUsecase})
      : super(const AddEditPostStateFormState());

  void clearValue() {
    emit(const AddEditPostStateFormState());
  }

  void contentChanged(String value) {
    final state = this.state as AddEditPostStateFormState;
    final content = Content.dirty(value);
    emit(state.copyWith(
      content: content,
      status: Formz.validate([content, state.image]),
    ));
  }

  void imageChanged(Uint8List? value) {
    final state = this.state as AddEditPostStateFormState;
    final image = Image.dirty(value);

    emit(state.copyWith(
      image: image,
      status: Formz.validate([state.content, image]),
    ));
  }

  Future<void> createPost() async {
    final state = this.state as AddEditPostStateFormState;
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    //Get the file in UInt8List format
    Uint8List? imageInBytes;
    if (state.image.value != null) {
      imageInBytes = state.image.value!;
    }

    final eitherResponse = await addPostUsecase.call(PostBody(
        content: state.content.value,
        image: imageInBytes,
        userId: '1',
        createdTime: DateTime.now()));

    emit(eitherResponse.fold((failure) {
      var errorMsg = failure.message;
      return state.copyWith(
          errorMessage: errorMsg, status: FormzStatus.submissionFailure);
    }, (success) {
      return state.copyWith(status: FormzStatus.submissionSuccess);
    }));
  }
}
