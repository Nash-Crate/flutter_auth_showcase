import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// External library injection for Internet connection
@module
abstract class InternetConnectionExternalLibraryInjectableModule {
  /// DI for Internet connection library
  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();
}
