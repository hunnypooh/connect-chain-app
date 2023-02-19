// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:demo_app/providers/repositories/goods_repository.dart';

import '../../models/custom_error.dart';
import '../../models/goods.dart';
import 'goods_list_state.dart';

class GoodsListProvider with ChangeNotifier {
  GoodsListState _state = GoodsListState.initial();
  GoodsListState get state => _state;

  final GoodsRepository goodsRepository;
  GoodsListProvider({
    required this.goodsRepository,
  });

  Future<void> getAllGoods({required String signin_user_id}) async {
    _state = _state.copyWith(goodsListStatus: GoodsListStatus.loading);
    notifyListeners();

    try {
      final List<Goods> goodsList =
          await goodsRepository.getAllGoods(signin_user_id: signin_user_id);

      _state = _state.copyWith(
        goodsListStatus: GoodsListStatus.loaded,
        goodsList: goodsList,
      ); //성공했으니까 새로운걸로 생성
      notifyListeners();
    } on CustomError catch (e) {
      _state =
          _state.copyWith(goodsListStatus: GoodsListStatus.error, error: e);
      notifyListeners();
    }
  }
}
