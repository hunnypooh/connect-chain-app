// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:demo_app/models/custom_error.dart';

import '../../models/goods.dart';

enum GoodsStatus {
  initial,
  loading,
  loaded,
  error,
}

class GoodsState extends Equatable {
  final GoodsStatus goodsStatus;
  final Goods goods;
  final CustomError error;
  GoodsState({
    required this.goodsStatus,
    required this.goods,
    required this.error,
  });

  factory GoodsState.initial() {
    return GoodsState(
      goodsStatus: GoodsStatus.initial,
      goods: Goods.initialGoods(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [goodsStatus, goods, error];

  @override
  bool get stringify => true;

  GoodsState copyWith({
    GoodsStatus? goodsStatus,
    Goods? goods,
    CustomError? error,
  }) {
    return GoodsState(
      goodsStatus: goodsStatus ?? this.goodsStatus,
      goods: goods ?? this.goods,
      error: error ?? this.error,
    );
  }
}
