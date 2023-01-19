import 'package:json_annotation/json_annotation.dart';

import 'user_e2e.dart';
import 'user_email.dart';
import 'user_oauth.dart';
import 'user_service.dart';
import 'user_setting.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;

  final DateTime createdAt;

  final List<String> roles;

  final String type;

  final bool active;

  final String? username;

  final String? name;

  final UserService? services;

  final List<UserEmail>? emails;

  final String? status;

  final String? statusConnection;

  final DateTime? lastLogin;

  final String? avatarOrigin;

  final num? utcOffset;

  final String? language;

  final String? statusDefault;

  final UserOauth? oauth;

  @JsonKey(name: '_updatedAt')
  final DateTime? updatedAt;

  final String? statusLiveChat;

  final UserE2e? e2e;

  final bool? requirePasswordChange;

  final Map<String, dynamic>? customFields;

  final UserSetting? settings;

  User({
    required this.id,
    required this.createdAt,
    required this.roles,
    required this.type,
    required this.active,
    this.username,
    this.name,
    this.services,
    this.emails,
    this.status,
    this.statusConnection,
    this.lastLogin,
    this.avatarOrigin,
    this.utcOffset,
    this.language,
    this.statusDefault,
    this.oauth,
    this.updatedAt,
    this.statusLiveChat,
    this.e2e,
    this.requirePasswordChange,
    this.customFields,
    this.settings,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
