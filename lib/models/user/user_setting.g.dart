// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSetting _$UserSettingFromJson(Map<String, dynamic> json) => UserSetting(
      profile: json['profile'],
      preferences: json['preferences'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UserSettingToJson(UserSetting instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'preferences': instance.preferences,
    };
