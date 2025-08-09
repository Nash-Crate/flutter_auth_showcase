import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// External library injection for Storage
@module
abstract class StorageExternalLibraryInjectableModule {
  /// DI for SharedPreferences library
  @preResolve
  Future<SharedPreferences> prefs() => SharedPreferences.getInstance();
}
