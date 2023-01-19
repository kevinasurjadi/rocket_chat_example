// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service_totp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceTotp _$UserServiceTotpFromJson(Map<String, dynamic> json) =>
    UserServiceTotp(
      enabled: json['enabled'] as bool,
      hashedBackup: (json['hashedBackup'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      secret: json['secret'] as String,
    );

Map<String, dynamic> _$UserServiceTotpToJson(UserServiceTotp instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'hashedBackup': instance.hashedBackup,
      'secret': instance.secret,
    };
