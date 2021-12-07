import 'package:flutter/material.dart';
import 'package:posting_system/src/config/routes/app_routes.dart';
import 'package:posting_system/src/features/auth/presentation/view/login_view.dart';
import 'package:posting_system/src/features/auth/presentation/view/register_view.dart';
import 'package:posting_system/src/features/posts/presentation/add_edit_post/view/add_edit_post_view.dart';
import 'package:posting_system/src/features/posts/presentation/posts/view/posts_view.dart';

class RouteGenerator {
  static Route<dynamic> generatedRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (_) {
          switch (routeSettings.name) {
            case AppRoutes.login:
              return const LoginView();
            case AppRoutes.register:
              return const RegisterView();
            case AppRoutes.home:
              return const PostsView();
            case AppRoutes.postAddEdit:
              return AddEditPostView(id: args);
            default:
              return const ErrorView();
          }
        });
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  }
}
