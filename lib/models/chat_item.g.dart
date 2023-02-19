// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatItem _$$_ChatItemFromJson(Map<String, dynamic> json) => _$_ChatItem(
      profileImagePath: json['profileImagePath'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      time: json['time'] as String,
      itemImagePath: json['itemImagePath'] as String,
      messageLatest: json['messageLatest'] as String,
    );

Map<String, dynamic> _$$_ChatItemToJson(_$_ChatItem instance) =>
    <String, dynamic>{
      'profileImagePath': instance.profileImagePath,
      'name': instance.name,
      'location': instance.location,
      'time': instance.time,
      'itemImagePath': instance.itemImagePath,
      'messageLatest': instance.messageLatest,
    };
