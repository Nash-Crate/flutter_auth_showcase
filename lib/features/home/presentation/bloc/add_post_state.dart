part of 'add_post_cubit.dart';

/// State for the AddPostCubit
@freezed
abstract class AddPostState with _$AddPostState {
  /// constructor
  const factory AddPostState({
    @Default('') String title,
    @Default('') String content,
    @Default('') String mediaPath,

    @Default(false) bool processing,
    Either<Failure, Unit>? result,
  }) = _AddPostState;

  /// Initial state
  factory AddPostState.initial() => const AddPostState();

  const AddPostState._();

  /// Check if the post is valid
  bool get isValid => title.isNotEmpty && content.isNotEmpty && mediaPath.isNotEmpty;

  /// Check if the media is a video
  bool get isVideo =>
      mediaPath.isNotEmpty &&
      (mediaPath.toLowerCase().endsWith('.mp4') ||
          mediaPath.toLowerCase().endsWith('.mkv') ||
          mediaPath.toLowerCase().endsWith('.avi') ||
          mediaPath.toLowerCase().endsWith('.mov') ||
          mediaPath.toLowerCase().endsWith('.flv'));

  /// Check if the media is an image
  bool get isImage =>
      mediaPath.isNotEmpty &&
      (mediaPath.toLowerCase().endsWith('.jpg') ||
          mediaPath.toLowerCase().endsWith('.jpeg') ||
          mediaPath.toLowerCase().endsWith('.png'));
}
