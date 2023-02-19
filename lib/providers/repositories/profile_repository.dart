import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/constants/db_constants.dart';
import 'package:demo_app/models/custom_error.dart';
import 'package:demo_app/models/user.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  ProfileRepository({
    required this.firebaseFirestore,
  });

  Future<User> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(uid).get();

      if (userDoc.exists) {
        //firestore에서 읽어오는 document가 존재하지 않을 수도 있음.
        final User currentUser = User.fromDoc(userDoc);

        return currentUser;
      }

      throw 'User not found';
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
