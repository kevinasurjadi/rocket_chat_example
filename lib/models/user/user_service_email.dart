import 'package:json_annotation/json_annotation.dart';

import 'user_email_verification_token.dart';

part 'user_service_email.g.dart';

@JsonSerializable()
class UserServiceEmail {
  final List<UserEmailVerificationToken>? verificationTokens;

  UserServiceEmail({this.verificationTokens});

  factory UserServiceEmail.fromJson(Map<String, dynamic> json) =>
      _$UserServiceEmailFromJson(json);

  Map<String, dynamic> toJson() => _$UserServiceEmailToJson(this);
}
