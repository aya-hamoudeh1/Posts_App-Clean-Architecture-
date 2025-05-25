import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/exception.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/features/post/data/models/post_model.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';
import 'package:posts_app/features/post/domain/repositories/posts_repository.dart';

import '../datasource/post_local_datasource.dart';
import '../datasource/post_remote_datasource.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  /// Get All Posts
  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  /// Add Posts
  @override
  Future<Either<Failure, Unit>> addPost(PostEntity post) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );

    return await _getMessage(() {
      return remoteDataSource.addPost(postModel);
    });
  }

  /// Delete Post
  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMessage(() {
      return remoteDataSource.deletePost(postId);
    });
  }

  /// Update Post
  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity post) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _getMessage(() {
      return remoteDataSource.updatePost(postModel);
    });
  }


  Future<Either<Failure, Unit>> _getMessage(
    DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
