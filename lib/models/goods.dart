import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goods.freezed.dart';
part 'goods.g.dart';

@freezed
class Goods with _$Goods {
  factory Goods({
    required String goods_id,
    required String goods_name,
    required List<String> imagePath,
    required String time, //새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
    required String goods_status, //새상품, 중고 상품
    required String user_id,
  }) = _Goods;

  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

  factory Goods.fromDoc(DocumentSnapshot goodsDoc) {
    final goodsData = goodsDoc.data() as Map<String, dynamic>?;
    List<dynamic> imagepathDynamic = goodsData!['imagePath'];
    List<String> imagepathString =
        imagepathDynamic.map((e) => e.toString()).toList();

    return Goods(
      goods_id: goodsDoc.id,
      goods_name: goodsData['goods_name'],
      imagePath: imagepathString,
      time: goodsData['time'],
      goods_status: goodsData['goods_status'],
      user_id: goodsData['user_id'],
    );
  }
  factory Goods.initialGoods() {
    return Goods(
      goods_id: "",
      goods_name: "",
      imagePath: [""],
      time: "",
      goods_status: "",
      user_id: "",
    );
  }
}
