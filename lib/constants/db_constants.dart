import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
final goodsRef = FirebaseFirestore.instance.collection('goods');
final postsRef = FirebaseFirestore.instance.collection('posts');

final storageRef = FirebaseStorage.instance.ref();
