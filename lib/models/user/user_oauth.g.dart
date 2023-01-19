// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_oauth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOauth _$UserOauthFromJson(Map<String, dynamic> json) => UserOauth(
      authorizedClients: (json['authorizedClients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserOauthToJson(UserOauth instance) => <String, dynamic>{
      'authorizedClients': instance.authorizedClients,
    };
