part of 'add_edit_post_cubit.dart';

abstract class AddEditPostState extends Equatable {
  const AddEditPostState();

  @override
  List<Object> get props => [];
}

class AddEditPostStateFormState extends AddEditPostState {
  const AddEditPostStateFormState(
      {this.content = const Content.pure(),
      this.image = const Image.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage});

  final Content content;
  final Image image;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [content, image, status];

  AddEditPostStateFormState copyWith({
    Content? content,
    Image? image,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AddEditPostStateFormState(
      content: content ?? this.content,
      image: image ?? this.image,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
