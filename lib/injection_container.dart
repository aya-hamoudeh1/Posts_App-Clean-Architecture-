import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/features/post/data/datasource/post_local_datasource.dart';
import 'package:posts_app/features/post/data/datasource/post_remote_datasource.dart';
import 'package:posts_app/features/post/data/repositories/post_repository_impl.dart';
import 'package:posts_app/features/post/domain/repositories/posts_repository.dart';
import 'package:posts_app/features/post/domain/usecase/add_post.dart';
import 'package:posts_app/features/post/domain/usecase/delete_post.dart';
import 'package:posts_app/features/post/domain/usecase/get_all_posts.dart';
import 'package:posts_app/features/post/domain/usecase/update_post.dart';
import 'package:posts_app/features/post/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/post/presentation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features Posts

  //Bloc
  sl.registerFactory(() => PostsBloc(getAllPostUsecase: sl()));
  sl.registerFactory(
    () => AddDeleteUpdatePostBloc(
      addPost: sl(),
      deletePost: sl(),
      updatePost: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(() => GetAllPostUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Datasource
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImp(client: sl()),
  );
  sl.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(sharedPreferences: sl()),
  );

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
