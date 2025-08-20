import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Usecase for uploading post media
@singleton
class UploadPostMedia implements Usecase<String, String> {
  /// Constructor
  const UploadPostMedia(this._postRepository);

  final IPostRepository _postRepository;

  @override
  Future<Either<Failure, String>> call(String mediaPath) {
    return _postRepository.uploadPostMedia(mediaPath);
  }
}
