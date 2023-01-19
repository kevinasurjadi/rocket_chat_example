import 'package:json_annotation/json_annotation.dart';

part 'user_service_totp.g.dart';

@JsonSerializable()
class UserServiceTotp {
  final bool enabled;

  final List<String> hashedBackup;

  final String secret;

  UserServiceTotp({
    required this.enabled,
    required this.hashedBackup,
    required this.secret,
  });

  factory UserServiceTotp.fromJson(Map<String, dynamic> json) =>
      _$UserServiceTotpFromJson(json);

  Map<String, dynamic> fromJson() => _$UserServiceTotpToJson(this);
}
