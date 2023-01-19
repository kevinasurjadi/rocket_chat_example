// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service_resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceResume _$UserServiceResumeFromJson(Map<String, dynamic> json) =>
    UserServiceResume(
      loginTokens: (json['loginTokens'] as List<dynamic>?)
          ?.map((e) => LoginToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserServiceResumeToJson(UserServiceResume instance) =>
    <String, dynamic>{
      'loginTokens': instance.loginTokens,
    };
