import 'package:dartz/dartz.dart';
import 'package:posts_app/features/post/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';

class DeletePostUsecase {
  final PostRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
