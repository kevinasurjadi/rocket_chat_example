// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_email_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEmailCode _$UserEmailCodeFromJson(Map<String, dynamic> json) =>
    UserEmailCode(
      code: json['code'] as String,
      expire: DateTime.parse(json['expire'] as String),
    );

Map<String, dynamic> _$UserEmailCodeToJson(UserEmailCode instance) =>
    <String, dynamic>{
      'code': instance.code,
      'expire': instance.expire.toIso8601String(),
    };
