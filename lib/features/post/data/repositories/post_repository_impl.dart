import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';
import 'package:posts_app/features/post/domain/repositories/posts_repository.dart';

import '../datasource/post_local_datasource.dart';
import '../datasource/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    await remoteDataSource.getAllPosts();
    await localDataSource.getCachedPosts();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
