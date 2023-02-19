// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo_app/models/post.dart';
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';

enum PostListStatus {
  initial,
  loading,
  loaded,
  error,
}

class PostListState extends Equatable {
  final PostListStatus postListStatus;
  final List<Post> postList;
  final CustomError error;
  PostListState({
    required this.postListStatus,
    required this.postList,
    required this.error,
  });

  factory PostListState.initial() {
    return PostListState(
      postListStatus: PostListStatus.initial,
      postList: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [postListStatus, postList, error];

  @override
  bool get stringify => true;

  PostListState copyWith({
    PostListStatus? postListStatus,
    List<Post>? postList,
    CustomError? error,
  }) {
    return PostListState(
      postListStatus: postListStatus ?? this.postListStatus,
      postList: postList ?? this.postList,
      error: error ?? this.error,
    );
  }
}

// class GoodsList with ChangeNotifier {
//   PostListState _state = PostListState.initial();
//   PostListState get state => _state;

//   void toggleGoods(String goods_id) {
//     final newGoods = _state.goods.map((Goods goods) {
//       if (goods.goods_id == goods_id) {
//         return Goods(
//           goods_id: goods_id,
//           imagePath: goods.imagePath,
//           time: goods.time,
//           title: goods.title,
//           desc: goods.desc,
//           price: goods.price,
//           like_ids: goods.like_ids,
//           like: !goods.like,
//           category: goods.category,
//           item_status: goods.item_status,
//           user_id: goods.user_id,
//         );
//       }
//       return goods;
//     }).toList();

//     _state = _state.copyWith(goods: newGoods);
//     notifyListeners();
//   }
// }
