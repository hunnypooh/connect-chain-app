// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';
import '../../models/post.dart';
import '../../models/user.dart';

enum PostStatus {
  initial,
  loading,
  loaded,
  error,
}

class PostState extends Equatable {
  final PostStatus postStatus;
  final Post post;
  final User user;
  final String thumbnailImagePath;
  final List<String> imagePaths;
  final CustomError error;
  PostState({
    required this.postStatus,
    required this.post,
    required this.user,
    required this.thumbnailImagePath,
    required this.imagePaths,
    required this.error,
  });

  factory PostState.initial() {
    return PostState(
      postStatus: PostStatus.initial,
      post: Post.initialPost(),
      user: User.initialUser(),
      thumbnailImagePath: "",
      imagePaths: [],
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [postStatus, post, error];

  @override
  bool get stringify => true;

  PostState copyWith({
    PostStatus? postStatus,
    Post? post,
    User? user,
    String? thumbnailImagePath,
    List<String>? imagePaths,
    CustomError? error,
  }) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      post: post ?? this.post,
      user: user ?? this.user,
      thumbnailImagePath: thumbnailImagePath ?? this.thumbnailImagePath,
      imagePaths: imagePaths ?? this.imagePaths,
      error: error ?? this.error,
    );
  }
}
