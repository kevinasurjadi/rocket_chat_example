import 'package:json_annotation/json_annotation.dart';

part 'user_email_code.g.dart';

@JsonSerializable()
class UserEmailCode {
  final String code;

  final DateTime expire;

  UserEmailCode({
    required this.code,
    required this.expire,
  });

  factory UserEmailCode.fromJson(Map<String, dynamic> json) =>
      _$UserEmailCodeFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailCodeToJson(this);
}
