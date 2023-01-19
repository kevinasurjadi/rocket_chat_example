import 'package:json_annotation/json_annotation.dart';

part 'user_oauth.g.dart';

@JsonSerializable()
class UserOauth {
  final List<String> authorizedClients;

  UserOauth({
    required this.authorizedClients,
  });

  factory UserOauth.fromJson(Map<String, dynamic> json) =>
      _$UserOauthFromJson(json);

  Map<String, dynamic> toJson() => _$UserOauthToJson(this);
}
