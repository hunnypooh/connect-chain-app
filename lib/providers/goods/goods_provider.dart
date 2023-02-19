// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo_app/models/goods.dart';
import 'package:flutter/material.dart';

import 'package:demo_app/providers/goods/goods_state.dart';
import 'package:demo_app/providers/repositories/goods_repository.dart';

import '../../models/custom_error.dart';

class GoodsProvider with ChangeNotifier {
  GoodsState _state = GoodsState.initial();
  GoodsState get state => _state;

  final GoodsRepository goodsRepository;
  GoodsProvider({
    required this.goodsRepository,
  });

  Future<void> getGoods({required String goodsId}) async {
    try {
      final Goods goods = await goodsRepository.getGoods(goodsId: goodsId);
      _state = _state.copyWith(
        goodsStatus: GoodsStatus.loaded,
        goods: goods,
      ); //성공했으니까 새로운걸로 생성
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(goodsStatus: GoodsStatus.error, error: e);
      notifyListeners();
    }
  }
}
