// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';
import '../../models/goods.dart';

enum GoodsListStatus {
  initial,
  loading,
  loaded,
  error,
}

class GoodsListState extends Equatable {
  final GoodsListStatus goodsListStatus;
  final List<Goods> goodsList;
  final CustomError error;
  GoodsListState({
    required this.goodsListStatus,
    required this.goodsList,
    required this.error,
  });

  factory GoodsListState.initial() {
    return GoodsListState(
      goodsListStatus: GoodsListStatus.initial,
      goodsList: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [goodsListStatus, goodsList, error];

  @override
  bool get stringify => true;

  GoodsListState copyWith({
    GoodsListStatus? goodsListStatus,
    List<Goods>? goodsList,
    CustomError? error,
  }) {
    return GoodsListState(
      goodsListStatus: goodsListStatus ?? this.goodsListStatus,
      goodsList: goodsList ?? this.goodsList,
      error: error ?? this.error,
    );
  }
}
