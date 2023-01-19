import 'package:json_annotation/json_annotation.dart';

part 'timestamp.g.dart';

@JsonSerializable()
class Timestamp {
  @JsonKey(name: '\$date')
  final int date;

  Timestamp({required this.date});

  factory Timestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestampFromJson(json);

  Map<String, dynamic> toJson() => _$TimestampToJson(this);
}
