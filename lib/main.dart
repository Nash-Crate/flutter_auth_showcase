import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase/app.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/firebase_options.dart';
import 'package:flutter_showcase/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// register bloc observer to show bloc errors globally
  Bloc.observer = MainBlocObserver();

  /// firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  // injectable library initialization
  await configureDependencies();

  runApp(const App());
}
