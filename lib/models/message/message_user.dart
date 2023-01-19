import 'package:json_annotation/json_annotation.dart';

part 'message_user.g.dart';

@JsonSerializable()
class MessageUser {
  @JsonKey(name: '_id')
  final String id;

  final String? username;

  final String? name;

  MessageUser({
    required this.id,
    this.username,
    this.name,
  });

  factory MessageUser.fromJson(Map<String, dynamic> json) =>
      _$MessageUserFromJson(json);

  Map<String, dynamic> toJson() => _$MessageUserToJson(this);
}
