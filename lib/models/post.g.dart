// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      post_id: json['post_id'] as String,
      goods_id: json['goods_id'] as String,
      title: json['title'] as String,
      thumbnailImagePath: json['thumbnailImagePath'] as String,
      imagePath:
          (json['imagePath'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      price: json['price'] as String,
      desc: json['desc'] as String,
      time: json['time'] as String,
      post_status: json['post_status'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'post_id': instance.post_id,
      'goods_id': instance.goods_id,
      'title': instance.title,
      'thumbnailImagePath': instance.thumbnailImagePath,
      'imagePath': instance.imagePath,
      'category': instance.category,
      'price': instance.price,
      'desc': instance.desc,
      'time': instance.time,
      'post_status': instance.post_status,
      'user_id': instance.user_id,
    };
