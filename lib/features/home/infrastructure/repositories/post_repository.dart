import 'package:flutter_showcase/features/common/errors/failures.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:flutter_showcase/features/home/infrastructure/datasources/datasources.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Repository for managing posts
@Singleton(as: IPostRepository)
class PostRepository implements IPostRepository {
  /// Constructor
  const PostRepository(this._remoteDatasource);

  final PostRemoteDatasource _remoteDatasource;

  @override
  Future<Either<Failure, Unit>> savePost(SavePostParams params) {
    return _remoteDatasource.savePost(params);
  }

  @override
  Future<Either<Failure, String>> uploadPostMedia(String mediaPath) {
    return _remoteDatasource.uploadPostMedia(mediaPath);
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts(GetPostsParams params) {
    return _remoteDatasource.getPosts(params);
  }
}
