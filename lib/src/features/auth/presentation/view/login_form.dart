import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:posting_system/src/config/routes/app_routes.dart';
import 'package:posting_system/src/config/theme/app_colors.dart';
import 'package:posting_system/src/core/utils/constants.dart';
import 'package:posting_system/src/features/auth/presentation/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(generalMargin30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Header(),
            const SizedBox(height: space24),
            _EmailTextFormField(),
            const SizedBox(height: space16),
            _PasswordTextFormField(),
            const SizedBox(height: space16),
            _LoginButton(),
            _AlreadyHaveAnAccoutLogin()
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(loginToContinue, style: Theme.of(context).textTheme.headline5);
  }
}

class _EmailTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.email.value != current.email.value,
      builder: (context, state) {
        return TextFormField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: email,
            hintText: hintEmail,
            errorText: state.email.invalid ? '$invalid $email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password.value != current.password.value,
      builder: (context, state) {
        return TextFormField(
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: password,
            hintText: '',
            errorText: state.password.invalid ? '$invalid $password' : null,
          ),
          obscureText: true,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.status.isValidated
                    ? () => context.read<LoginCubit>().loginWithCredentials()
                    : null,
                child: const Text(login),
                style: ElevatedButton.styleFrom(
                  onSurface: AppColor.purple,
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                ),
              );
      },
    );
  }
}

class _AlreadyHaveAnAccoutLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          alreadyHaveAnAccount,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.register);
            },
            child: Text(
              register,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColor.purple),
            )),
      ],
    );
  }
}
