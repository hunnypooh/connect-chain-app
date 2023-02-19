// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_History _$$_HistoryFromJson(Map<String, dynamic> json) => _$_History(
      goods_id: json['goods_id'] as String,
      user_id: json['user_id'] as String,
      goods_image_path: json['goods_image_path'] as String,
      user_image_path: json['user_image_path'] as String,
      when: json['when'] as String,
      number: json['number'] as int,
      who: json['who'] as String,
      level: json['level'] as int,
    );

Map<String, dynamic> _$$_HistoryToJson(_$_History instance) =>
    <String, dynamic>{
      'goods_id': instance.goods_id,
      'user_id': instance.user_id,
      'goods_image_path': instance.goods_image_path,
      'user_image_path': instance.user_image_path,
      'when': instance.when,
      'number': instance.number,
      'who': instance.who,
      'level': instance.level,
    };
