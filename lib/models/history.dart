import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';
part 'history.g.dart';

@freezed
class History with _$History {
  factory History({
    required String goods_id, //goods_id로 이미지, when, number를 얻고
    required String user_id, //user_id로 who, trust 얻기
    required String goods_image_path,
    required String user_image_path,
    required String when, //년, 월, 일로 받기
    required int number,
    required String who,
    required int level,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
