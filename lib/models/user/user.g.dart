// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      active: json['active'] as bool,
      username: json['username'] as String?,
      name: json['name'] as String?,
      services: json['services'] == null
          ? null
          : UserService.fromJson(json['services'] as Map<String, dynamic>),
      emails: (json['emails'] as List<dynamic>?)
          ?.map((e) => UserEmail.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      statusConnection: json['statusConnection'] as String?,
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      avatarOrigin: json['avatarOrigin'] as String?,
      utcOffset: json['utcOffset'] as num?,
      language: json['language'] as String?,
      statusDefault: json['statusDefault'] as String?,
      oauth: json['oauth'] == null
          ? null
          : UserOauth.fromJson(json['oauth'] as Map<String, dynamic>),
      updatedAt: json['_updatedAt'] == null
          ? null
          : DateTime.parse(json['_updatedAt'] as String),
      statusLiveChat: json['statusLiveChat'] as String?,
      e2e: json['e2e'] == null
          ? null
          : UserE2e.fromJson(json['e2e'] as Map<String, dynamic>),
      requirePasswordChange: json['requirePasswordChange'] as bool?,
      customFields: json['customFields'] as Map<String, dynamic>?,
      settings: json['settings'] == null
          ? null
          : UserSetting.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'roles': instance.roles,
      'type': instance.type,
      'active': instance.active,
      'username': instance.username,
      'name': instance.name,
      'services': instance.services,
      'emails': instance.emails,
      'status': instance.status,
      'statusConnection': instance.statusConnection,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'avatarOrigin': instance.avatarOrigin,
      'utcOffset': instance.utcOffset,
      'language': instance.language,
      'statusDefault': instance.statusDefault,
      'oauth': instance.oauth,
      '_updatedAt': instance.updatedAt?.toIso8601String(),
      'statusLiveChat': instance.statusLiveChat,
      'e2e': instance.e2e,
      'requirePasswordChange': instance.requirePasswordChange,
      'customFields': instance.customFields,
      'settings': instance.settings,
    };
