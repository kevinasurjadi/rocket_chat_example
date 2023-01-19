// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['_id'] as String,
      roomId: json['rid'] as String,
      text: json['msg'] as String,
      threadMessageId: json['tmid'] as String,
      timestamp: Timestamp.fromJson(json['ts'] as Map<String, dynamic>),
      mentions: (json['mentions'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      user: MessageUser.fromJson(json['u'] as Map<String, dynamic>),
      markdown: json['md'] as Map<String, dynamic>,
      starredUserIds:
          (json['starred'] as List<dynamic>).map((e) => e as String).toList(),
      pinned: json['pinned'] as bool,
      unread: json['unread'] as bool,
      temporal: json['temporal'] as bool,
      directRoomId: json['drid'] as String,
      updatedAt: Timestamp.fromJson(json['_updatedAt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      '_id': instance.id,
      'rid': instance.roomId,
      'msg': instance.text,
      'tmid': instance.threadMessageId,
      'ts': instance.timestamp,
      'mentions': instance.mentions,
      'u': instance.user,
      'md': instance.markdown,
      'starred': instance.starredUserIds,
      'pinned': instance.pinned,
      'unread': instance.unread,
      'temporal': instance.temporal,
      'drid': instance.directRoomId,
      '_updatedAt': instance.updatedAt,
    };
