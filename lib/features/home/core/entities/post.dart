import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

/// Media type enum
enum MediaTypeEnum {
  /// Image media type
  image,

  /// Video media type
  video,
}

/// Post entity
@freezed
abstract class Post with _$Post {
  /// constructor
  const factory Post({
    required String id,
    required String title,
    required String content,
    required String? mediaUrl,
    required MediaTypeEnum? mediaType,
    required DateTime createdAt,
    required DateTime? updatedAt,
  }) = _Post;
}
