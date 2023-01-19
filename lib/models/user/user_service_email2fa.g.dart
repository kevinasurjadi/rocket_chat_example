// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service_email2fa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceEmail2fa _$UserServiceEmail2faFromJson(Map<String, dynamic> json) =>
    UserServiceEmail2fa(
      enabled: json['enabled'] as bool,
      changedAt: DateTime.parse(json['changedAt'] as String),
    );

Map<String, dynamic> _$UserServiceEmail2faToJson(
        UserServiceEmail2fa instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'changedAt': instance.changedAt.toIso8601String(),
    };
