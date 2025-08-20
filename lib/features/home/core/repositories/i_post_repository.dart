import 'package:flutter_showcase/features/common/errors/failures.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:fpdart/fpdart.dart';

/// An interface for the Post repository.
mixin IPostRepository {
  /// Uploads media for a post and returns the uploaded media URL.
  Future<Either<Failure, String>> uploadPostMedia(String mediaPath);

  /// Saves a post with the given parameters.
  Future<Either<Failure, Unit>> savePost(SavePostParams params);

  /// get all posts
  Future<Either<Failure, List<Post>>> getPosts(GetPostsParams params);
}
