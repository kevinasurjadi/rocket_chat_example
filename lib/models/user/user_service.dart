import 'package:json_annotation/json_annotation.dart';

import 'user_email_code.dart';
import 'user_service_email.dart';
import 'user_service_email2fa.dart';
import 'user_service_password.dart';
import 'user_service_resume.dart';
import 'user_service_totp.dart';

part 'user_service.g.dart';

@JsonSerializable()
class UserService {
  final UserServicePassword? password;

  final UserServiceEmail? email;

  final UserServiceResume? resume;

  final dynamic google;

  final dynamic facebook;

  final dynamic github;

  final UserServiceTotp? totp;

  final UserServiceEmail2fa? email2fa;

  final List<UserEmailCode> emailCode;

  UserService({
    required this.emailCode,
    this.password,
    this.email,
    this.resume,
    this.google,
    this.facebook,
    this.github,
    this.totp,
    this.email2fa,
  });

  factory UserService.fromJson(Map<String, dynamic> json) =>
      _$UserServiceFromJson(json);

  Map<String, dynamic> toJson() => _$UserServiceToJson(this);
}
