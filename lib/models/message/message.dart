import 'package:json_annotation/json_annotation.dart';
import 'package:rocket_chat_example/models/timestamp.dart';

import 'message_user.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'rid')
  final String roomId;

  @JsonKey(name: 'msg')
  final String text;

  @JsonKey(name: 'tmid')
  final String threadMessageId;

  @JsonKey(name: 'ts')
  final Timestamp timestamp;

  final List<Map<String, dynamic>> mentions;

  @JsonKey(name: 'u')
  final MessageUser user;

  @JsonKey(name: 'md')
  final Map<String, dynamic> markdown;

  @JsonKey(name: 'starred')
  final List<String> starredUserIds;

  final bool pinned;

  final bool unread;

  final bool temporal;

  @JsonKey(name: 'drid')
  final String directRoomId;

  @JsonKey(name: '_updatedAt')
  final Timestamp updatedAt;

  Message({
    required this.id,
    required this.roomId,
    required this.text,
    required this.threadMessageId,
    required this.timestamp,
    required this.mentions,
    required this.user,
    required this.markdown,
    required this.starredUserIds,
    required this.pinned,
    required this.unread,
    required this.temporal,
    required this.directRoomId,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
