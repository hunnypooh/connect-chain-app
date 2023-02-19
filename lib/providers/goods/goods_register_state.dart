// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:demo_app/models/custom_error.dart';

enum GoodsRegisterStatus {
  initial,
  submitting,
  uploading,
  uploaded,
  // success,
  error,
}

class GoodsRegisterState extends Equatable {
  final GoodsRegisterStatus goodsRegisterStatus;
  final CustomError error;
  GoodsRegisterState({
    required this.goodsRegisterStatus,
    required this.error,
  });

  factory GoodsRegisterState.initial() {
    return GoodsRegisterState(
      goodsRegisterStatus: GoodsRegisterStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [goodsRegisterStatus, error];

  @override
  bool get stringify => true;

  GoodsRegisterState copyWith({
    GoodsRegisterStatus? goodsRegisterStatus,
    CustomError? error,
  }) {
    return GoodsRegisterState(
      goodsRegisterStatus: goodsRegisterStatus ?? this.goodsRegisterStatus,
      error: error ?? this.error,
    );
  }
}
