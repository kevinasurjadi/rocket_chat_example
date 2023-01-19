import 'package:json_annotation/json_annotation.dart';
import 'package:rocket_chat_example/models/room/room_type.dart';
import 'package:rocket_chat_example/models/timestamp.dart';
import 'package:rocket_chat_example/models/user/user.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
  @JsonKey(name: 't')
  final RoomType type;

  @JsonKey(name: 'ts')
  final Timestamp timestamp;

  @JsonKey(name: 'ls')
  final Timestamp lastSeenTimestamp;

  final String name;

  @JsonKey(name: 'rid')
  final String roomId;

  @JsonKey(name: 'u')
  final User user;

  final bool open;

  final bool alert;

  final List<String>? roles;

  final int unread;

  @JsonKey(name: 'tunread')
  final List<String>? unreadIds;

  @JsonKey(name: 'tunreadGroup')
  final List<String>? unreadGroupIds;

  @JsonKey(name: 'tunreadUser')
  final List<String>? unreadMentionIds;

  @JsonKey(name: '_updatedAt')
  final Timestamp updatedAt;

  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'lr')
  final Timestamp lastReplyTimestamp;

  final bool hideUnreadStatus;

  final bool teamMain;

  final String? teamId;

  final int userMentions;

  final int groupMentions;

  @JsonKey(name: 'prid')
  final String parentRoomId;

  final bool onHold;

  Subscription({
    required this.type,
    required this.timestamp,
    required this.lastSeenTimestamp,
    required this.name,
    required this.roomId,
    required this.user,
    required this.open,
    required this.alert,
    required this.unread,
    required this.updatedAt,
    required this.id,
    required this.lastReplyTimestamp,
    required this.hideUnreadStatus,
    required this.teamMain,
    required this.userMentions,
    required this.groupMentions,
    required this.parentRoomId,
    required this.onHold,
    this.roles,
    this.unreadIds,
    this.unreadGroupIds,
    this.unreadMentionIds,
    this.teamId,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
