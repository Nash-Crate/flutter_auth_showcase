import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_showcase/features/common/errors/failures.dart';
import 'package:flutter_showcase/features/home/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// remote datasource interface for post repository
abstract class PostRemoteDatasource with IPostRepository {}

/// Implementation of the PostRemoteDatasource interface
@Singleton(as: PostRemoteDatasource)
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  /// Constructor
  const PostRemoteDatasourceImpl(this._firebaseStorage, this._firestore);

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  @override
  Future<Either<Failure, Unit>> savePost(SavePostParams params) async {
    try {
      final postData = {
        'title': params.title,
        'content': params.content,
        'mediaUrl': params.mediaUrl,
        'mediaType': params.mediaType?.name,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('posts').add(postData);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(Failure('Failed to save post: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadPostMedia(String mediaPath) async {
    try {
      final file = File(mediaPath);
      final ref = _firebaseStorage.ref().child('posts/${file.uri.pathSegments.last}');
      final uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return Right(downloadUrl);
    } on Exception catch (e) {
      return Left(Failure('Failed to upload media: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts(GetPostsParams params) async {
    try {
      final querySnapshot = await _firestore.collection('posts').get();
      final posts = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Post(
          id: doc.id,
          title: data['title'] as String,
          content: data['content'] as String,
          mediaUrl: data['mediaUrl'] as String?,
          mediaType: (data['mediaType'] as String?)?.toMediaTypeEnum(),
          createdAt: (data['createdAt'] as Timestamp).toDate(),
          updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
        );
      }).toList();

      return Right(posts);
    } on Exception catch (e) {
      return Left(Failure('Failed to get posts: $e'));
    }
  }
}

extension on String? {
  MediaTypeEnum? toMediaTypeEnum() {
    if (this == null) return null;

    switch (this!.toLowerCase()) {
      case 'image':
        return MediaTypeEnum.image;
      case 'video':
        return MediaTypeEnum.video;
      default:
        return null;
    }
  }
}
