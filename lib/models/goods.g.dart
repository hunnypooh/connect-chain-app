// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Goods _$$_GoodsFromJson(Map<String, dynamic> json) => _$_Goods(
      goods_id: json['goods_id'] as String,
      goods_name: json['goods_name'] as String,
      imagePath:
          (json['imagePath'] as List<dynamic>).map((e) => e as String).toList(),
      time: json['time'] as String,
      goods_status: json['goods_status'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$$_GoodsToJson(_$_Goods instance) => <String, dynamic>{
      'goods_id': instance.goods_id,
      'goods_name': instance.goods_name,
      'imagePath': instance.imagePath,
      'time': instance.time,
      'goods_status': instance.goods_status,
      'user_id': instance.user_id,
    };
