import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum RoomType {
  @JsonValue('d')
  directChat,
  @JsonValue('c')
  chat,
  @JsonValue('p')
  privateChat,
  @JsonValue('l')
  liveChat,
}
