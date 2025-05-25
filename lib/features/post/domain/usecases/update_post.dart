import 'package:dartz/dartz.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';
import 'package:posts_app/features/post/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';

class UpdatePostUsecase {
  final PostRepository repository ;

  UpdatePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call (PostEntity post) async {
    return await repository.updatePost(post);
  }
}