// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserServiceEmail _$UserServiceEmailFromJson(Map<String, dynamic> json) =>
    UserServiceEmail(
      verificationTokens: (json['verificationTokens'] as List<dynamic>?)
          ?.map((e) =>
              UserEmailVerificationToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserServiceEmailToJson(UserServiceEmail instance) =>
    <String, dynamic>{
      'verificationTokens': instance.verificationTokens,
    };
