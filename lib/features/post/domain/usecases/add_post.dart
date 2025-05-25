import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repository.dart';

class AddPostUsecase {
  final PostRepository repository;

  AddPostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(PostEntity post) async {
    return await repository.updatePost(post);
  }
}
