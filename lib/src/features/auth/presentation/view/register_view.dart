import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/core/di/injection_container.dart';
import 'package:posting_system/src/features/auth/presentation/cubit/register_cubit.dart';
import 'package:posting_system/src/features/auth/presentation/view/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterCubit>(
        create: (_) => sl<RegisterCubit>(),
        child: const RegisterForm(),
      ),
    );
  }
}
