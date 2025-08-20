import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_posts_params.freezed.dart';

/// Parameters for getting posts
@freezed
abstract class GetPostsParams with _$GetPostsParams {
  /// constructor
  const factory GetPostsParams({
    /// The number of posts to skip for pagination
    @Default(0) int skip,

    /// The number of posts to limit for pagination
    @Default(10) int limit,

    /// The search query to filter posts by title or content
    String? searchQuery,
  }) = _GetPostsParams;
}
