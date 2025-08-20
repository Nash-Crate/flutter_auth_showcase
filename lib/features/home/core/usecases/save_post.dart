import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for saving a post
@singleton
class SavePost implements Usecase<Unit, SavePostParams> {
  /// Constructor
  const SavePost(this._postRepository);

  final IPostRepository _postRepository;

  @override
  Future<Either<Failure, Unit>> call(SavePostParams params) {
    return _postRepository.savePost(params);
  }
}
