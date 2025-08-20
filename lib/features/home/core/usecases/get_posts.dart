import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase to get posts
@singleton
class GetPosts implements Usecase<List<Post>, GetPostsParams> {
  /// Constructor
  const GetPosts(this._repository);

  final IPostRepository _repository;

  @override
  Future<Either<Failure, List<Post>>> call(GetPostsParams params) {
    return _repository.getPosts(params);
  }
}
