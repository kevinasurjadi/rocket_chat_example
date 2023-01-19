// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUser _$MessageUserFromJson(Map<String, dynamic> json) => MessageUser(
      id: json['_id'] as String,
      username: json['username'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MessageUserToJson(MessageUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'name': instance.name,
    };
