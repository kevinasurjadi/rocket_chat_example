// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServicePassword _$UserServicePasswordFromJson(Map<String, dynamic> json) =>
    UserServicePassword(
      bcrypt: json['bcrypt'] as String,
    );

Map<String, dynamic> _$UserServicePasswordToJson(
        UserServicePassword instance) =>
    <String, dynamic>{
      'bcrypt': instance.bcrypt,
    };
