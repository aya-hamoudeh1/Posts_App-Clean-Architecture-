import 'package:dartz/dartz.dart';
import 'package:posts_app/features/post/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/post_entity.dart';

class GetAllPostUsecase {
  final PostRepository repository;

  GetAllPostUsecase(this.repository);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repository.getAllPosts();
  }
}
