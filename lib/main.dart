import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posting_system/src/config/routes/app_routes.dart';
import 'package:posting_system/src/config/routes/route_generator.dart';
import 'package:posting_system/src/config/theme/app_theme.dart';
import 'package:posting_system/src/core/di/injection_container.dart' as di;
import 'package:posting_system/src/features/posts/presentation/add_edit_post/cubit/add_edit_post_cubit.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddEditPostCubit>(create: (_) => di.sl<AddEditPostCubit>())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: ThemeData.dark(),
          initialRoute: AppRoutes.login,
          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: RouteGenerator.generatedRoute),
    );
  }
}
