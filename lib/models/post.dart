import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String post_id,
    required String goods_id, //선택한 nft 굿즈 아이디
    required String title,
    required String thumbnailImagePath,
    required List<String> imagePath,
    required String category,
    required String price,
    required String desc,
    required String time, //글 등록 날짜
    required String post_status, //판매중, 판매완료
    required String user_id,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDoc(DocumentSnapshot postDoc) {
    final postData = postDoc.data() as Map<String, dynamic>?;
    List<dynamic> imagepathDynamic = postData!['imagePath'];
    List<String> imagepathString =
        imagepathDynamic.map((e) => e.toString()).toList();

    return Post(
      post_id: postDoc.id,
      goods_id: postData['goods_id'],
      title: postData['title'],
      thumbnailImagePath: postData['thumbnailImagePath'],
      imagePath: imagepathString,
      category: postData['category'],
      price: postData['price'],
      desc: postData['desc'],
      time: postData['time'],
      post_status: postData['post_status'],
      user_id: postData['user_id'],
    );
  }
  factory Post.initialPost() {
    return Post(
      post_id: "",
      goods_id: "",
      title: "",
      thumbnailImagePath: "",
      imagePath: [""],
      category: "",
      price: "",
      desc: "",
      time: "",
      post_status: "",
      user_id: "",
    );
  }
}
