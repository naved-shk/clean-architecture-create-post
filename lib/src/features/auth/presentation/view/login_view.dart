import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/core/di/injection_container.dart';
import 'package:posting_system/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:posting_system/src/features/auth/presentation/view/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (_) => sl<LoginCubit>(),
        child: const LoginForm(),
      ),
    );
  }
}
