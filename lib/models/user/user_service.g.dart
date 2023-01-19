// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserService _$UserServiceFromJson(Map<String, dynamic> json) => UserService(
      emailCode: (json['emailCode'] as List<dynamic>)
          .map((e) => UserEmailCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      password: json['password'] == null
          ? null
          : UserServicePassword.fromJson(
              json['password'] as Map<String, dynamic>),
      email: json['email'] == null
          ? null
          : UserServiceEmail.fromJson(json['email'] as Map<String, dynamic>),
      resume: json['resume'] == null
          ? null
          : UserServiceResume.fromJson(json['resume'] as Map<String, dynamic>),
      google: json['google'],
      facebook: json['facebook'],
      github: json['github'],
      totp: json['totp'] == null
          ? null
          : UserServiceTotp.fromJson(json['totp'] as Map<String, dynamic>),
      email2fa: json['email2fa'] == null
          ? null
          : UserServiceEmail2fa.fromJson(
              json['email2fa'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserServiceToJson(UserService instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
      'resume': instance.resume,
      'google': instance.google,
      'facebook': instance.facebook,
      'github': instance.github,
      'totp': instance.totp,
      'email2fa': instance.email2fa,
      'emailCode': instance.emailCode,
    };
