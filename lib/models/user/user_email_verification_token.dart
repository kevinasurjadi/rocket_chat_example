import 'package:json_annotation/json_annotation.dart';

part 'user_email_verification_token.g.dart';

@JsonSerializable()
class UserEmailVerificationToken {
  final String token;

  final String address;

  final DateTime when;

  UserEmailVerificationToken({
    required this.token,
    required this.address,
    required this.when,
  });

  factory UserEmailVerificationToken.fromJson(Map<String, dynamic> json) =>
      _$UserEmailVerificationTokenFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailVerificationTokenToJson(this);
}
