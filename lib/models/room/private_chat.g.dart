// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateChat _$PrivateChatFromJson(Map<String, dynamic> json) => PrivateChat(
      id: json['_id'] as String,
      type: $enumDecodeNullable(_$RoomTypeEnumMap, json['t']) ??
          RoomType.privateChat,
      readOnly: json['ro'] as bool,
      name: json['name'] as String,
      user: json['u'] == null
          ? null
          : User.fromJson(json['u'] as Map<String, dynamic>),
      topic: json['topic'] as String?,
      muted:
          (json['muted'] as List<dynamic>?)?.map((e) => e as String).toList(),
      jitsyTimeout: json['jitsyTimeout'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PrivateChatToJson(PrivateChat instance) =>
    <String, dynamic>{
      '_id': instance.id,
      't': _$RoomTypeEnumMap[instance.type]!,
      'name': instance.name,
      'u': instance.user,
      'topic': instance.topic,
      'muted': instance.muted,
      'jitsyTimeout': instance.jitsyTimeout,
      'ro': instance.readOnly,
    };

const _$RoomTypeEnumMap = {
  RoomType.directChat: 'd',
  RoomType.chat: 'c',
  RoomType.privateChat: 'p',
  RoomType.liveChat: 'l',
};
