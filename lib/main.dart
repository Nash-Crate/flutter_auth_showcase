import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/app.dart';
import 'package:flutter_showcase/firebase_options.dart';
import 'package:flutter_showcase/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // injectable library initialization
  await configureDependencies();

  runApp(const App());
}
