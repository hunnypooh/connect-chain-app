// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get post_id => throw _privateConstructorUsedError;
  String get goods_id => throw _privateConstructorUsedError; //선택한 nft 굿즈 아이디
  String get title => throw _privateConstructorUsedError;
  String get thumbnailImagePath => throw _privateConstructorUsedError;
  List<String> get imagePath => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError; //글 등록 날짜
  String get post_status => throw _privateConstructorUsedError; //판매중, 판매완료
  String get user_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String post_id,
      String goods_id,
      String title,
      String thumbnailImagePath,
      List<String> imagePath,
      String category,
      String price,
      String desc,
      String time,
      String post_status,
      String user_id});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? post_id = freezed,
    Object? goods_id = freezed,
    Object? title = freezed,
    Object? thumbnailImagePath = freezed,
    Object? imagePath = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? desc = freezed,
    Object? time = freezed,
    Object? post_status = freezed,
    Object? user_id = freezed,
  }) {
    return _then(_value.copyWith(
      post_id: post_id == freezed
          ? _value.post_id
          : post_id // ignore: cast_nullable_to_non_nullable
              as String,
      goods_id: goods_id == freezed
          ? _value.goods_id
          : goods_id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImagePath: thumbnailImagePath == freezed
          ? _value.thumbnailImagePath
          : thumbnailImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      post_status: post_status == freezed
          ? _value.post_status
          : post_status // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String post_id,
      String goods_id,
      String title,
      String thumbnailImagePath,
      List<String> imagePath,
      String category,
      String price,
      String desc,
      String time,
      String post_status,
      String user_id});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, (v) => _then(v as _$_Post));

  @override
  _$_Post get _value => super._value as _$_Post;

  @override
  $Res call({
    Object? post_id = freezed,
    Object? goods_id = freezed,
    Object? title = freezed,
    Object? thumbnailImagePath = freezed,
    Object? imagePath = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? desc = freezed,
    Object? time = freezed,
    Object? post_status = freezed,
    Object? user_id = freezed,
  }) {
    return _then(_$_Post(
      post_id: post_id == freezed
          ? _value.post_id
          : post_id // ignore: cast_nullable_to_non_nullable
              as String,
      goods_id: goods_id == freezed
          ? _value.goods_id
          : goods_id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImagePath: thumbnailImagePath == freezed
          ? _value.thumbnailImagePath
          : thumbnailImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value._imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      post_status: post_status == freezed
          ? _value.post_status
          : post_status // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  _$_Post(
      {required this.post_id,
      required this.goods_id,
      required this.title,
      required this.thumbnailImagePath,
      required final List<String> imagePath,
      required this.category,
      required this.price,
      required this.desc,
      required this.time,
      required this.post_status,
      required this.user_id})
      : _imagePath = imagePath;

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String post_id;
  @override
  final String goods_id;
//선택한 nft 굿즈 아이디
  @override
  final String title;
  @override
  final String thumbnailImagePath;
  final List<String> _imagePath;
  @override
  List<String> get imagePath {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePath);
  }

  @override
  final String category;
  @override
  final String price;
  @override
  final String desc;
  @override
  final String time;
//글 등록 날짜
  @override
  final String post_status;
//판매중, 판매완료
  @override
  final String user_id;

  @override
  String toString() {
    return 'Post(post_id: $post_id, goods_id: $goods_id, title: $title, thumbnailImagePath: $thumbnailImagePath, imagePath: $imagePath, category: $category, price: $price, desc: $desc, time: $time, post_status: $post_status, user_id: $user_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.post_id, post_id) &&
            const DeepCollectionEquality().equals(other.goods_id, goods_id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailImagePath, thumbnailImagePath) &&
            const DeepCollectionEquality()
                .equals(other._imagePath, _imagePath) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.post_status, post_status) &&
            const DeepCollectionEquality().equals(other.user_id, user_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(post_id),
      const DeepCollectionEquality().hash(goods_id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(thumbnailImagePath),
      const DeepCollectionEquality().hash(_imagePath),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(post_status),
      const DeepCollectionEquality().hash(user_id));

  @JsonKey(ignore: true)
  @override
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required final String post_id,
      required final String goods_id,
      required final String title,
      required final String thumbnailImagePath,
      required final List<String> imagePath,
      required final String category,
      required final String price,
      required final String desc,
      required final String time,
      required final String post_status,
      required final String user_id}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get post_id;
  @override
  String get goods_id;
  @override //선택한 nft 굿즈 아이디
  String get title;
  @override
  String get thumbnailImagePath;
  @override
  List<String> get imagePath;
  @override
  String get category;
  @override
  String get price;
  @override
  String get desc;
  @override
  String get time;
  @override //글 등록 날짜
  String get post_status;
  @override //판매중, 판매완료
  String get user_id;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
