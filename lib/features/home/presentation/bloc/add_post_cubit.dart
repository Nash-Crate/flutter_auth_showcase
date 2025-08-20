import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/extensions/extensions.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'add_post_cubit.freezed.dart';
part 'add_post_state.dart';

/// Cubit for managing the state of adding a post
@injectable
class AddPostCubit extends Cubit<AddPostState> {
  /// Constructor
  AddPostCubit(this._uploadPostMedia, this._savePost) : super(AddPostState.initial());

  final UploadPostMedia _uploadPostMedia;
  final SavePost _savePost;

  /// set the post title
  void setPostTitle(String title) => emit(state.copyWith(title: title));

  /// set the post content
  void setPostContent(String content) => emit(state.copyWith(content: content));

  /// pick media for the post from the file picker
  Future<void> pickMediaFromFilePicker() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
    );

    if (result != null) {
      final file = result.files.first;
      // Set the media path in the state
      emit(state.copyWith(mediaPath: file.path ?? ''));
    }
  }

  /// pick media for the post from the image picker
  Future<void> pickMediaFromImagePicker({required bool fromGallery, required bool isVideo}) async {
    final picker = ImagePicker();

    if (fromGallery) {
      final mediaRes = await picker.pickMedia();

      if (mediaRes != null) {
        emit(state.copyWith(mediaPath: mediaRes.path));
        return;
      }
    }

    if (isVideo) {
      final videoRes = await picker.pickVideo(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      );
      if (videoRes != null) {
        emit(state.copyWith(mediaPath: videoRes.path));
        return;
      }
    }

    final imageRes = await picker.pickImage(source: ImageSource.camera);
    if (imageRes != null) {
      emit(state.copyWith(mediaPath: imageRes.path));
      return;
    }
  }

  /// set the post
  Future<void> savePost() async {
    emit(state.copyWith(processing: true));

    String? mediaPath;
    if (state.mediaPath.isNotEmpty) {
      // upload the media if it exists
      final res = await _uploadPostMedia(state.mediaPath);
      if (res.isLeft()) {
        addError(res.asL);

        emit(state.copyWith(processing: false, result: Left(res.asL)));
        return;
      }

      mediaPath = res.asR;
    }

    // then save the data
    final params = SavePostParams(
      title: state.title,
      content: state.content,
      mediaUrl: mediaPath,
      mediaType: mediaPath != null
          ? state.isImage
                ? MediaTypeEnum.image
                : MediaTypeEnum.video
          : null,
    );
    final saveRes = await _savePost(params);
    if (saveRes.isLeft()) {
      addError(saveRes.asL);
      emit(state.copyWith(processing: false, result: Left(saveRes.asL)));
      return;
    }

    // on success
    emit(
      state.copyWith(
        processing: false,
        result: const Right(unit),

        // reset after successful post
        title: '',
        content: '',
        mediaPath: '',
      ),
    );
  }
}
