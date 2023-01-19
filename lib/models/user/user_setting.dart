import 'package:json_annotation/json_annotation.dart';

part 'user_setting.g.dart';

@JsonSerializable()
class UserSetting {
  final dynamic profile;

  final Map<String, dynamic> preferences;

  UserSetting({
    required this.profile,
    required this.preferences,
  });

  factory UserSetting.fromJson(Map<String, dynamic> json) =>
      _$UserSettingFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingToJson(this);
}
