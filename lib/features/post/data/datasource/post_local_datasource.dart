import 'package:dartz/dartz.dart';
import 'package:posts_app/features/post/data/models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModel);
}


class PostLocalDataSourceImpl implements PostLocalDataSource{
  @override
  Future<Unit> cachePosts(List<PostModel> postModel) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
  
}