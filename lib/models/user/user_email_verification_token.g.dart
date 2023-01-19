// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_email_verification_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEmailVerificationToken _$UserEmailVerificationTokenFromJson(
        Map<String, dynamic> json) =>
    UserEmailVerificationToken(
      token: json['token'] as String,
      address: json['address'] as String,
      when: DateTime.parse(json['when'] as String),
    );

Map<String, dynamic> _$UserEmailVerificationTokenToJson(
        UserEmailVerificationToken instance) =>
    <String, dynamic>{
      'token': instance.token,
      'address': instance.address,
      'when': instance.when.toIso8601String(),
    };
