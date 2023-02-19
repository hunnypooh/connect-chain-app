// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:demo_app/providers/goods/goods_register_state.dart';
import 'package:demo_app/providers/repositories/goods_repository.dart';

import '../../constants/db_constants.dart';
import '../../models/custom_error.dart';

class GoodsRegisterProvider with ChangeNotifier {
  GoodsRegisterState _state = GoodsRegisterState.initial();
  GoodsRegisterState get state => _state;

  final GoodsRepository goodsRepository;
  GoodsRegisterProvider({
    required this.goodsRepository,
  });

  Future<void> registerGoods({
    required String goods_id,
    required List<File>? imagesFileList,
    required List<String> imagesUrlList,
    required String goods_name,
    required List<String> imagePath,
    required String time, //새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
    required String goods_status, //새상품, 중고 상품
    required String user_id,
  }) async {
    try {
      _state =
          _state.copyWith(goodsRegisterStatus: GoodsRegisterStatus.submitting);
      notifyListeners();
      print(_state.goodsRegisterStatus);
      uploadImages(
        goodsId: goods_id,
        imagesFileList: imagesFileList,
        imagesUrlList: imagesUrlList,
      ).whenComplete(
        () {
          registerGoodsAfterUploadImages(
            goods_id: goods_id,
            goods_name: goods_name,
            imagePath: imagePath,
            time: time,
            goods_status: goods_status,
            user_id: user_id,
          );
          _state =
              _state.copyWith(goodsRegisterStatus: GoodsRegisterStatus.initial);
          notifyListeners();
          print(_state.goodsRegisterStatus);
        },
      );
    } on CustomError catch (e) {
      _state = _state.copyWith(
        goodsRegisterStatus: GoodsRegisterStatus.error,
        error: e,
      );
      notifyListeners();
      rethrow;
    }
  }

  Future<void> uploadImages({
    required String goodsId,
    required List<File>? imagesFileList,
    required List<String> imagesUrlList,
  }) async {
    _state =
        _state.copyWith(goodsRegisterStatus: GoodsRegisterStatus.uploading);
    notifyListeners();
    print(_state.goodsRegisterStatus);

    try {
      int i = 0;
      for (var image in imagesFileList!) {
        final tmpRef = storageRef.child("images/goods/${goodsId}/${i}");
        await tmpRef.putFile(image).whenComplete(() async {
          await tmpRef.getDownloadURL().then((value) {
            imagesUrlList.add(value);
            i++;
            print('$imagesUrlList\n');
          });
        });
      }

      _state =
          _state.copyWith(goodsRegisterStatus: GoodsRegisterStatus.uploaded);
      notifyListeners();
      print(_state.goodsRegisterStatus);
    } on CustomError catch (e) {
      _state = _state.copyWith(
        goodsRegisterStatus: GoodsRegisterStatus.error,
        error: e,
      );
      notifyListeners();
      rethrow;
    }
  }

  Future<void> registerGoodsAfterUploadImages({
    required String goods_id,
    required String goods_name,
    required List<String> imagePath,
    required String time, //새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
    required String goods_status, //새상품, 중고 상품
    required String user_id,
  }) async {
    try {
      await goodsRepository.registerGoods(
        goods_id: goods_id,
        goods_name: goods_name,
        imagePath: imagePath,
        time: time,
        goods_status: goods_status,
        user_id: user_id,
      );
    } on CustomError catch (e) {
      _state = _state.copyWith(
        goodsRegisterStatus: GoodsRegisterStatus.error,
        error: e,
      );
      notifyListeners();
      rethrow;
    }
  }

  // Future<void> changeStateAfterSuccesss() async {
  //   if (_state == GoodsRegisterStatus.success) {
  //     Future.delayed(Duration(milliseconds: 100), () {
  //       _state =
  //           _state.copyWith(goodsRegisterStatus: GoodsRegisterStatus.initial);
  //       notifyListeners();
  //     });
  //   }
  // }
}
