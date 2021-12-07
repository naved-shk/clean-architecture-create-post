import 'dart:typed_data';

import 'package:formz/formz.dart';

/// Validation errors for the [Image] [FormzInput].
enum ImageValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template image}
/// Form input for an name input.
/// {@endtemplate}
class Image extends FormzInput<Uint8List?, ImageValidationError> {
  /// {@macro image}
  const Image.pure() : super.pure(null);

  /// {@macro image}
  const Image.dirty([Uint8List? value]) : super.dirty(value);

  @override
  ImageValidationError? validator(Uint8List? value) {
    return null;
  }
}
