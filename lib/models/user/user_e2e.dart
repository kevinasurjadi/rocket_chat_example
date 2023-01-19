import 'package:json_annotation/json_annotation.dart';

part 'user_e2e.g.dart';

@JsonSerializable()
class UserE2e {
  @JsonKey(name: 'private_key')
  final String privateKey;

  @JsonKey(name: 'public_key')
  final String publicKey;

  UserE2e({
    required this.privateKey,
    required this.publicKey,
  });

  factory UserE2e.fromJson(Map<String, dynamic> json) =>
      _$UserE2eFromJson(json);

  Map<String, dynamic> toJson() => _$UserE2eToJson(this);
}
