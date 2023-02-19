// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/goods.dart';

import '../../constants/db_constants.dart';
import '../../models/custom_error.dart';

class GoodsRepository {
  final FirebaseFirestore firebaseFirestore;
  GoodsRepository({
    required this.firebaseFirestore,
  });

  Future<void> registerGoods({
    required String goods_id,
    required String goods_name,
    required List<String> imagePath,
    required String time, //새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
    required String goods_status, //새상품, 중고 상품
    required String user_id,
  }) async {
    try {
      await goodsRef.doc(goods_id).set({
        'goods_id': goods_id,
        'goods_name': goods_name,
        'imagePath': imagePath,
        'time': time,
        'goods_status': goods_status,
        'user_id': user_id,
      });
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<Goods> getGoods({required String goodsId}) async {
    try {
      final DocumentSnapshot goodsDoc = await goodsRef.doc(goodsId).get();
      if (goodsDoc.exists) {
        //firestore에서 읽어오는 document가 존재하지 않을 수도 있음.
        final Goods goods = Goods.fromDoc(goodsDoc);

        return goods;
      }
      throw 'Goods not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<List<Goods>> getAllGoods({required String signin_user_id}) async {
    try {
      List<Goods> _resGoodsList = [];
      QuerySnapshot querySnapshot = await goodsRef.get();
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          if (Goods.fromDoc(doc).user_id == signin_user_id) {
            _resGoodsList.add(Goods.fromDoc(doc));
          }
        }
      });
      return _resGoodsList;
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
