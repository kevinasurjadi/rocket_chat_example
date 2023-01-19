// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['_id'] as String,
      type: $enumDecodeNullable(_$RoomTypeEnumMap, json['t']) ?? RoomType.chat,
      name: json['name'] as String,
      user: json['u'] == null
          ? null
          : User.fromJson(json['u'] as Map<String, dynamic>),
      topic: json['topic'] as String?,
      muted:
          (json['muted'] as List<dynamic>?)?.map((e) => e as String).toList(),
      jitsyTimeout: json['jitsyTimeout'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      '_id': instance.id,
      't': _$RoomTypeEnumMap[instance.type]!,
      'name': instance.name,
      'u': instance.user,
      'topic': instance.topic,
      'muted': instance.muted,
      'jitsyTimeout': instance.jitsyTimeout,
    };

const _$RoomTypeEnumMap = {
  RoomType.directChat: 'd',
  RoomType.chat: 'c',
  RoomType.privateChat: 'p',
  RoomType.liveChat: 'l',
};
