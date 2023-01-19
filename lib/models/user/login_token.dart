import 'package:json_annotation/json_annotation.dart';

part 'login_token.g.dart';

@JsonSerializable()
class LoginToken {
  final String hashedToken;

  final DateTime? twoFactorAuthorizedUntil;

  final String? twoFactorAuthorizedHash;

  LoginToken({
    required this.hashedToken,
    this.twoFactorAuthorizedUntil,
    this.twoFactorAuthorizedHash,
  });

  factory LoginToken.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTokenToJson(this);
}
