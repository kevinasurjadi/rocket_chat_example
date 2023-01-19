import 'package:json_annotation/json_annotation.dart';
import 'package:rocket_chat_example/models/user/user.dart';

import 'room.dart';
import 'room_type.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat extends Room {
  final String name;

  @JsonKey(name: 'u')
  final User? user;

  final String? topic;

  final List<String>? muted;

  final Map<String, dynamic>? jitsyTimeout;

  Chat({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 't') RoomType type = RoomType.chat,
    required this.name,
    this.user,
    this.topic,
    this.muted,
    this.jitsyTimeout,
  }) : super(
          id: id,
          type: RoomType.chat,
        );

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
