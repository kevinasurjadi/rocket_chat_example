import 'package:json_annotation/json_annotation.dart';

part 'user_service_email2fa.g.dart';

@JsonSerializable()
class UserServiceEmail2fa {
  final bool enabled;

  final DateTime changedAt;

  UserServiceEmail2fa({
    required this.enabled,
    required this.changedAt,
  });

  factory UserServiceEmail2fa.fromJson(Map<String, dynamic> json) =>
      _$UserServiceEmail2faFromJson(json);

  Map<String, dynamic> toJson() => _$UserServiceEmail2faToJson(this);
}
