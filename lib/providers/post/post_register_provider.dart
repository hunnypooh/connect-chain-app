// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:demo_app/providers/post/post_register_state.dart';
import 'package:demo_app/providers/repositories/post_repository.dart';

import '../../models/custom_error.dart';

class PostRegisterProvider with ChangeNotifier {
  PostRegisterState _state = PostRegisterState.initial();
  PostRegisterState get state => _state;

  final PostRepository postRepository;
  PostRegisterProvider({
    required this.postRepository,
  });

  Future<void> registerPost({
    required String goods_id, //선택한 nft 굿즈 아이디
    required String title,
    required String thumbnailImagePath,
    required List<String> imagePath,
    required String category,
    required String price,
    required String desc,
    required String time, //글 등록 날짜
    required String user_id,
  }) async {
    _state = _state.copyWith(postRegisterStatus: PostRegisterStatus.submitting);
    notifyListeners();

    try {
      await postRepository.registerPost(
        goods_id: goods_id,
        title: title,
        thumbnailImagePath: thumbnailImagePath,
        imagePath: imagePath,
        category: category,
        price: price,
        desc: desc,
        time: time,
        user_id: user_id,
      );

      _state = _state.copyWith(postRegisterStatus: PostRegisterStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(
        postRegisterStatus: PostRegisterStatus.error,
        error: e,
      );
      notifyListeners();
      rethrow;
    }
  }
}
