import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

/// External library injection for Firebase
@module
abstract class FirebaseExternalLibraryInjectableModule {
  /// Firestore
  @singleton
  FirebaseFirestore get res => FirebaseFirestore.instance;

  /// Firebase Storage
  @singleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
}
