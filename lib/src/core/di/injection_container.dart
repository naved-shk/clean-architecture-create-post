import 'package:get_it/get_it.dart';
import 'package:posting_system/src/features/auth/data/data_sources/user_dao.dart';
import 'package:posting_system/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:posting_system/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:posting_system/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:posting_system/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:posting_system/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:posting_system/src/features/auth/presentation/cubit/register_cubit.dart';
import 'package:posting_system/src/features/posts/data/data_source/post_dao.dart';
import 'package:posting_system/src/features/posts/data/repositories/post_repository_impl.dart';
import 'package:posting_system/src/features/posts/domain/repositories/post_repository.dart';
import 'package:posting_system/src/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:posting_system/src/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:posting_system/src/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:posting_system/src/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:posting_system/src/features/posts/presentation/add_edit_post/cubit/add_edit_post_cubit.dart';
import 'package:posting_system/src/features/posts/presentation/posts/cubit/posts_cubit.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

//Dependency injection
Future<void> init() async {
  //Cubit
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(registerUsecase: sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUsecase: sl()));
  sl.registerFactory<AddEditPostCubit>(
      () => AddEditPostCubit(addPostUsecase: sl(), updatePostUsecase: sl()));
  sl.registerFactory<PostsCubit>(
      () => PostsCubit(getPostsUsecase: sl(), deletePostUsecase: sl()));

  //Use cases
  sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton(() => AddPostUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetPostsUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(repository: sl()));

  //Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(userDAO: sl()));
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postDAO: sl()));

  //Data sources
  sl.registerLazySingleton<UserDAO>(() => UserDAO());
  sl.registerLazySingleton<PostDAO>(() => PostDAO());
}
