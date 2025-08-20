import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

/// Auth user entity
@freezed
abstract class AuthUser with _$AuthUser {
  /// constructor
  const factory AuthUser({
    required String id,
    required String email,
    required String name,
  }) = _AuthUser;
}
