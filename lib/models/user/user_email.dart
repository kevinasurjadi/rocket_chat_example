import 'package:json_annotation/json_annotation.dart';

part 'user_email.g.dart';

@JsonSerializable()
class UserEmail {
  final String address;

  final bool verified;

  UserEmail({
    required this.address,
    required this.verified,
  });

  factory UserEmail.fromJson(Map<String, dynamic> json) =>
      _$UserEmailFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailToJson(this);
}
