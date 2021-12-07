import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:posting_system/src/features/auth/data/models/request/user_body.dart';
import 'package:posting_system/src/features/auth/data/models/validation/email.dart';
import 'package:posting_system/src/features/auth/data/models/validation/name.dart';
import 'package:posting_system/src/features/auth/data/models/validation/password.dart';
import 'package:posting_system/src/features/auth/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterCubit({required this.registerUsecase}) : super(const RegisterState());

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.email, state.password]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.name, email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.name, state.email, password]),
    ));
  }

  Future<void> registerWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final eitherResponse = await registerUsecase.call(UserBody(
        fullName: state.name.value,
        email: state.email.value,
        password: state.password.value,
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
