// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../constants/db_constants.dart';
import '../../models/custom_error.dart';
import '../../models/goods.dart';
import '../../models/post.dart';
import '../../models/user.dart';

class PostRepository {
  final FirebaseFirestore firebaseFirestore;
  PostRepository({
    required this.firebaseFirestore,
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
    try {
      final post_id = const Uuid().v4();
      await postsRef.doc(post_id).set({
        'post_id': post_id,
        'goods_id': goods_id,
        'title': title,
        'thumbnailImagePath': thumbnailImagePath,
        'imagePath': imagePath,
        'category': category,
        'price': price,
        'desc': desc,
        'time': time,
        'post_status': "판매중",
        'user_id': user_id,
      });
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<List<Post>> getAllPost() async {
    try {
      List<Post> _resPostList = [];
      QuerySnapshot querySnapshot = await postsRef.get();
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          print(Post.fromDoc(doc));
          _resPostList.add(Post.fromDoc(doc));
        }
      });
      return _resPostList;
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<Post> getPost({required String postId}) async {
    try {
      final DocumentSnapshot postDoc = await postsRef.doc(postId).get();
      if (postDoc.exists) {
        //firestore에서 읽어오는 document가 존재하지 않을 수도 있음.
        final Post post = Post.fromDoc(postDoc);

        return post;
      }
      throw 'Post not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<User> getPostWriter({required String userId}) async {
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(userId).get();
      if (userDoc.exists) {
        //firestore에서 읽어오는 document가 존재하지 않을 수도 있음.
        final User user = User.fromDoc(userDoc);

        return user;
      }
      throw 'Writers not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<String> getThumbnailImagePath({required String goodsId}) async {
    try {
      final DocumentSnapshot goodsDoc = await goodsRef.doc(goodsId).get();
      if (goodsDoc.exists) {
        //firestore에서 읽어오는 document가 존재하지 않을 수도 있음.
        final Goods goods = Goods.fromDoc(goodsDoc);
        return goods.imagePath[0];
      }
      throw 'Goods not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<List<String>> getImagePaths({required String goodsId}) async {
    try {
      final DocumentSnapshot goodsDoc = await goodsRef.doc(goodsId).get();
      if (goodsDoc.exists) {
        //firestore에서 읽어오는 document가 존재하지 않을 수도 있음.
        final Goods goods = Goods.fromDoc(goodsDoc);
        return goods.imagePath;
      }
      throw 'Goods not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
