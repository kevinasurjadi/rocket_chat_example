import 'package:json_annotation/json_annotation.dart';

part 'user_service_password.g.dart';

@JsonSerializable()
class UserServicePassword {
  final String bcrypt;

  UserServicePassword({required this.bcrypt});

  factory UserServicePassword.fromJson(Map<String, dynamic> json) =>
      _$UserServicePasswordFromJson(json);

  Map<String, dynamic> toJson() => _$UserServicePasswordToJson(this);
}
