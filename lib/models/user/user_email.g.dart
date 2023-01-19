// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEmail _$UserEmailFromJson(Map<String, dynamic> json) => UserEmail(
      address: json['address'] as String,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$UserEmailToJson(UserEmail instance) => <String, dynamic>{
      'address': instance.address,
      'verified': instance.verified,
    };
