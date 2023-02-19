// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:demo_app/providers/repositories/goods_repository.dart';
import 'package:demo_app/providers/repositories/post_repository.dart';
import 'package:flutter/material.dart';

import '../../models/custom_error.dart';
import '../../models/post.dart';
import '../../models/user.dart';
import 'post_state.dart';

class PostProvider with ChangeNotifier {
  PostState _state = PostState.initial();
  PostState get state => _state;

  final PostRepository postRepository;
  PostProvider({
    required this.postRepository,
  });

  Future<void> getPost({required String postId}) async {
    _state = _state.copyWith(postStatus: PostStatus.loading);
    notifyListeners();
    try {
      final Post post = await postRepository.getPost(postId: postId);
      final User user =
          await postRepository.getPostWriter(userId: post.user_id);
      final String thumbnailImagePath =
          await postRepository.getThumbnailImagePath(goodsId: post.goods_id);
      final List<String> imagePaths =
          await postRepository.getImagePaths(goodsId: post.goods_id);
      _state = _state.copyWith(
        postStatus: PostStatus.loaded,
        post: post,
        user: user,
        thumbnailImagePath: thumbnailImagePath,
        imagePaths: imagePaths,
      ); //성공했으니까 새로운걸로 생성
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(postStatus: PostStatus.error, error: e);
      notifyListeners();
    }
  }
}
