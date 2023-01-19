import 'package:json_annotation/json_annotation.dart';

import 'login_token.dart';

part 'user_service_resume.g.dart';

@JsonSerializable()
class UserServiceResume {
  final List<LoginToken>? loginTokens;

  UserServiceResume({this.loginTokens});

  factory UserServiceResume.fromJson(Map<String, dynamic> json) =>
      _$UserServiceResumeFromJson(json);

  Map<String, dynamic> toJson() => _$UserServiceResumeToJson(this);
}
