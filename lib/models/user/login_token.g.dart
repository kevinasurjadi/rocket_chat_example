// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginToken _$LoginTokenFromJson(Map<String, dynamic> json) => LoginToken(
      hashedToken: json['hashedToken'] as String,
      twoFactorAuthorizedUntil: json['twoFactorAuthorizedUntil'] == null
          ? null
          : DateTime.parse(json['twoFactorAuthorizedUntil'] as String),
      twoFactorAuthorizedHash: json['twoFactorAuthorizedHash'] as String?,
    );

Map<String, dynamic> _$LoginTokenToJson(LoginToken instance) =>
    <String, dynamic>{
      'hashedToken': instance.hashedToken,
      'twoFactorAuthorizedUntil':
          instance.twoFactorAuthorizedUntil?.toIso8601String(),
      'twoFactorAuthorizedHash': instance.twoFactorAuthorizedHash,
    };
