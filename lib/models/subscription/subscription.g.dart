// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      type: $enumDecode(_$RoomTypeEnumMap, json['t']),
      timestamp: Timestamp.fromJson(json['ts'] as Map<String, dynamic>),
      lastSeenTimestamp: Timestamp.fromJson(json['ls'] as Map<String, dynamic>),
      name: json['name'] as String,
      roomId: json['rid'] as String,
      user: User.fromJson(json['u'] as Map<String, dynamic>),
      open: json['open'] as bool,
      alert: json['alert'] as bool,
      unread: json['unread'] as int,
      updatedAt: Timestamp.fromJson(json['_updatedAt'] as Map<String, dynamic>),
      id: json['_id'] as String,
      lastReplyTimestamp:
          Timestamp.fromJson(json['lr'] as Map<String, dynamic>),
      hideUnreadStatus: json['hideUnreadStatus'] as bool,
      teamMain: json['teamMain'] as bool,
      userMentions: json['userMentions'] as int,
      groupMentions: json['groupMentions'] as int,
      parentRoomId: json['prid'] as String,
      onHold: json['onHold'] as bool,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      unreadIds:
          (json['tunread'] as List<dynamic>?)?.map((e) => e as String).toList(),
      unreadGroupIds: (json['tunreadGroup'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      unreadMentionIds: (json['tunreadUser'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      teamId: json['teamId'] as String?,
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      't': _$RoomTypeEnumMap[instance.type]!,
      'ts': instance.timestamp,
      'ls': instance.lastSeenTimestamp,
      'name': instance.name,
      'rid': instance.roomId,
      'u': instance.user,
      'open': instance.open,
      'alert': instance.alert,
      'roles': instance.roles,
      'unread': instance.unread,
      'tunread': instance.unreadIds,
      'tunreadGroup': instance.unreadGroupIds,
      'tunreadUser': instance.unreadMentionIds,
      '_updatedAt': instance.updatedAt,
      '_id': instance.id,
      'lr': instance.lastReplyTimestamp,
      'hideUnreadStatus': instance.hideUnreadStatus,
      'teamMain': instance.teamMain,
      'teamId': instance.teamId,
      'userMentions': instance.userMentions,
      'groupMentions': instance.groupMentions,
      'prid': instance.parentRoomId,
      'onHold': instance.onHold,
    };

const _$RoomTypeEnumMap = {
  RoomType.directChat: 'd',
  RoomType.chat: 'c',
  RoomType.privateChat: 'p',
  RoomType.liveChat: 'l',
};
