import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:posting_system/src/features/auth/data/models/request/user_body.dart';
import 'package:posting_system/src/features/auth/data/models/validation/email.dart';
import 'package:posting_system/src/features/auth/data/models/validation/password.dart';
import 'package:posting_system/src/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(const LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> loginWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final eitherResponse = await loginUsecase.call(
        UserBody(email: state.email.value, password: state.password.value));

    emit(eitherResponse.fold((failure) {
      var errorMsg = failure.message;
      return state.copyWith(
          errorMessage: errorMsg, status: FormzStatus.submissionFailure);
    }, (success) {
      return state.copyWith(status: FormzStatus.submissionSuccess);
    }));
  }
}
