import 'package:dio/dio.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:injectable/injectable.dart';

/// External library injection for Http libraries
@module
abstract class HttpExternalLibraryInjectableModule {
  /// DI for Dio
  @lazySingleton
  Dio get dio {
    return Dio(
      BaseOptions(
        baseUrl: httpBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }
}
