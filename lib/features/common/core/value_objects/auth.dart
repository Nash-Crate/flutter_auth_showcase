// Following "Really Obvious Code" (ROC),
// ignore_for_file: public_member_api_docs

import 'package:flutter_auth/features/common/common.dart';
import 'package:fpdart/fpdart.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String? input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);

  @override
  final Either<ValueFailure<String?>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String? input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);

  @override
  final Either<ValueFailure<String?>, String> value;
}
