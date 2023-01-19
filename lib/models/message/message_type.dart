import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum MessageType {
  @JsonValue('r')
  roomNameChanged,
  @JsonValue('au')
  userAddedBy,
  @JsonValue('ru')
  userRemovedBy,
  @JsonValue('ul')
  userLeft,
  @JsonValue('ult')
  userLeftTeam,
  @JsonValue('uj')
  userJoinChannel,
  @JsonValue('ujt')
  userJoinTeam,
  @JsonValue('ut')
  userJoinConversation,
  @JsonValue('rm')
  messageRemoved,
  @JsonValue('added-user-to-team')
  addedUserToTeam,
  @JsonValue('removed-user-from-team')
  removedUserFromTeam,
  @JsonValue('user-muted')
  userMuted,
}
