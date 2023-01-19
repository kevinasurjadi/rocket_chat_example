import 'package:json_annotation/json_annotation.dart';

import 'room_type.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 't')
  final RoomType type;

  Room({
    required this.id,
    required this.type,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
