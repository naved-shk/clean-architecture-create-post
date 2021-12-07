import 'package:formz/formz.dart';

/// Validation errors for the [Content] [FormzInput].
enum ContentValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template name}
/// Form input for an name input.
/// {@endtemplate}
class Content extends FormzInput<String, ContentValidationError> {
  /// {@macro content}
  const Content.pure() : super.pure('');

  /// {@macro content}
  const Content.dirty([String value = '']) : super.dirty(value);

  @override
  ContentValidationError? validator(String? value) {
    return value!.isNotEmpty ? null : ContentValidationError.invalid;
  }
}
