import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_post_params.freezed.dart';

/// Parameters for saving a post
@freezed
abstract class SavePostParams with _$SavePostParams {
  /// Constructor
  const factory SavePostParams({
    required String title,
    required String content,
    required String? mediaUrl,
    required MediaTypeEnum? mediaType,
  }) = _SavePostParams;
}
