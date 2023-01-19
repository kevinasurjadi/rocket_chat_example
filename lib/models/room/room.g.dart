// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['_id'] as String,
      type: $enumDecode(_$RoomTypeEnumMap, json['t']),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      '_id': instance.id,
      't': _$RoomTypeEnumMap[instance.type]!,
    };

const _$RoomTypeEnumMap = {
  RoomType.directChat: 'd',
  RoomType.chat: 'c',
  RoomType.privateChat: 'p',
  RoomType.liveChat: 'l',
};
