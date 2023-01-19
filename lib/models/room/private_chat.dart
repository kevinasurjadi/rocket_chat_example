import 'package:json_annotation/json_annotation.dart';
import 'package:rocket_chat_example/models/user/user.dart';

import 'room.dart';
import 'room_type.dart';

part 'private_chat.g.dart';

@JsonSerializable()
class PrivateChat extends Room {
  final String name;

  @JsonKey(name: 'u')
  final User? user;

  final String? topic;

  final List<String>? muted;

  final Map<String, dynamic>? jitsyTimeout;

  @JsonKey(name: 'ro')
  final bool readOnly;

  PrivateChat({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 't') RoomType type = RoomType.privateChat,
    required this.readOnly,
    required this.name,
    this.user,
    this.topic,
    this.muted,
    this.jitsyTimeout,
  }) : super(
          id: id,
          type: RoomType.privateChat,
        );

  factory PrivateChat.fromJson(Map<String, dynamic> json) =>
      _$PrivateChatFromJson(json);

  Map<String, dynamic> toJson() => _$PrivateChatToJson(this);
}
