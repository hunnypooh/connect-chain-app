// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:demo_app/providers/repositories/post_repository.dart';
import 'package:flutter/material.dart';

import '../../models/custom_error.dart';
import '../../models/post.dart';
import 'post_list_state.dart';

class PostListProvider with ChangeNotifier {
  // List<Goods> goodsList = [];
  PostListState _state = PostListState.initial();
  PostListState get state => _state;

  final PostRepository postRepository;
  PostListProvider({
    required this.postRepository,
  });

  void getAllPost() async {
    _state = _state.copyWith(postListStatus: PostListStatus.loading);
    notifyListeners();

    try {
      List<Post> postList = await postRepository.getAllPost();

      _state = _state.copyWith(
        postListStatus: PostListStatus.loaded,
        postList: postList,
      );
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(postListStatus: PostListStatus.error, error: e);
      notifyListeners();
    }
  }

  // void toggleGoods(String goods_id) {
  //   final newGoods = _state.goodsList.map((Goods goods) {
  //     if (goods.goods_id == goods_id) {
  //       return Goods(
  //         goods_id: goods_id,
  //         // imagePath: goods.imagePath,
  //         time: goods.time,
  //         title: goods.title,
  //         desc: goods.desc,
  //         price: goods.price,
  //         // like_ids: goods.like_ids,
  //         like: !goods.like,
  //         category: goods.category,
  //         item_status: goods.item_status,
  //         user_id: goods.user_id,
  //       );
  //     }
  //     return goods;
  //   }).toList();

  //   _state = _state.copyWith(goodsList: newGoods);
  //   notifyListeners();
  // }
}
