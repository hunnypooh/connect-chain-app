// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:demo_app/models/custom_error.dart';

enum PostRegisterStatus {
  initial,
  submitting,
  success,
  error,
}

class PostRegisterState extends Equatable {
  final PostRegisterStatus postRegisterStatus;
  final CustomError error;
  PostRegisterState({
    required this.postRegisterStatus,
    required this.error,
  });

  factory PostRegisterState.initial() {
    return PostRegisterState(
      postRegisterStatus: PostRegisterStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [PostRegisterStatus, error];

  @override
  bool get stringify => true;

  PostRegisterState copyWith({
    PostRegisterStatus? postRegisterStatus,
    CustomError? error,
  }) {
    return PostRegisterState(
      postRegisterStatus: postRegisterStatus ?? this.postRegisterStatus,
      error: error ?? this.error,
    );
  }
}
