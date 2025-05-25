import 'package:posts_app/features/post/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAllPosts();
  Future<bool> deletePost(int id);
  Future<bool> updatePost(PostEntity post);
  Future<bool> addPost(PostEntity post);
}
