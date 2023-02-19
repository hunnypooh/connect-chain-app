// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'goods.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return _Goods.fromJson(json);
}

/// @nodoc
mixin _$Goods {
  String get goods_id => throw _privateConstructorUsedError;
  String get goods_name => throw _privateConstructorUsedError;
  List<String> get imagePath => throw _privateConstructorUsedError;
  String get time =>
      throw _privateConstructorUsedError; //새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
  String get goods_status => throw _privateConstructorUsedError; //새상품, 중고 상품
  String get user_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoodsCopyWith<Goods> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodsCopyWith<$Res> {
  factory $GoodsCopyWith(Goods value, $Res Function(Goods) then) =
      _$GoodsCopyWithImpl<$Res>;
  $Res call(
      {String goods_id,
      String goods_name,
      List<String> imagePath,
      String time,
      String goods_status,
      String user_id});
}

/// @nodoc
class _$GoodsCopyWithImpl<$Res> implements $GoodsCopyWith<$Res> {
  _$GoodsCopyWithImpl(this._value, this._then);

  final Goods _value;
  // ignore: unused_field
  final $Res Function(Goods) _then;

  @override
  $Res call({
    Object? goods_id = freezed,
    Object? goods_name = freezed,
    Object? imagePath = freezed,
    Object? time = freezed,
    Object? goods_status = freezed,
    Object? user_id = freezed,
  }) {
    return _then(_value.copyWith(
      goods_id: goods_id == freezed
          ? _value.goods_id
          : goods_id // ignore: cast_nullable_to_non_nullable
              as String,
      goods_name: goods_name == freezed
          ? _value.goods_name
          : goods_name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<String>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      goods_status: goods_status == freezed
          ? _value.goods_status
          : goods_status // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GoodsCopyWith<$Res> implements $GoodsCopyWith<$Res> {
  factory _$$_GoodsCopyWith(_$_Goods value, $Res Function(_$_Goods) then) =
      __$$_GoodsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String goods_id,
      String goods_name,
      List<String> imagePath,
      String time,
      String goods_status,
      String user_id});
}

/// @nodoc
class __$$_GoodsCopyWithImpl<$Res> extends _$GoodsCopyWithImpl<$Res>
    implements _$$_GoodsCopyWith<$Res> {
  __$$_GoodsCopyWithImpl(_$_Goods _value, $Res Function(_$_Goods) _then)
      : super(_value, (v) => _then(v as _$_Goods));

  @override
  _$_Goods get _value => super._value as _$_Goods;

  @override
  $Res call({
    Object? goods_id = freezed,
    Object? goods_name = freezed,
    Object? imagePath = freezed,
    Object? time = freezed,
    Object? goods_status = freezed,
    Object? user_id = freezed,
  }) {
    return _then(_$_Goods(
      goods_id: goods_id == freezed
          ? _value.goods_id
          : goods_id // ignore: cast_nullable_to_non_nullable
              as String,
      goods_name: goods_name == freezed
          ? _value.goods_name
          : goods_name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value._imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<String>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      goods_status: goods_status == freezed
          ? _value.goods_status
          : goods_status // ignore: cast_nullable_to_non_nullable
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
class _$_Goods implements _Goods {
  _$_Goods(
      {required this.goods_id,
      required this.goods_name,
      required final List<String> imagePath,
      required this.time,
      required this.goods_status,
      required this.user_id})
      : _imagePath = imagePath;

  factory _$_Goods.fromJson(Map<String, dynamic> json) =>
      _$$_GoodsFromJson(json);

  @override
  final String goods_id;
  @override
  final String goods_name;
  final List<String> _imagePath;
  @override
  List<String> get imagePath {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePath);
  }

  @override
  final String time;
//새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
  @override
  final String goods_status;
//새상품, 중고 상품
  @override
  final String user_id;

  @override
  String toString() {
    return 'Goods(goods_id: $goods_id, goods_name: $goods_name, imagePath: $imagePath, time: $time, goods_status: $goods_status, user_id: $user_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Goods &&
            const DeepCollectionEquality().equals(other.goods_id, goods_id) &&
            const DeepCollectionEquality()
                .equals(other.goods_name, goods_name) &&
            const DeepCollectionEquality()
                .equals(other._imagePath, _imagePath) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.goods_status, goods_status) &&
            const DeepCollectionEquality().equals(other.user_id, user_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(goods_id),
      const DeepCollectionEquality().hash(goods_name),
      const DeepCollectionEquality().hash(_imagePath),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(goods_status),
      const DeepCollectionEquality().hash(user_id));

  @JsonKey(ignore: true)
  @override
  _$$_GoodsCopyWith<_$_Goods> get copyWith =>
      __$$_GoodsCopyWithImpl<_$_Goods>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoodsToJson(
      this,
    );
  }
}

abstract class _Goods implements Goods {
  factory _Goods(
      {required final String goods_id,
      required final String goods_name,
      required final List<String> imagePath,
      required final String time,
      required final String goods_status,
      required final String user_id}) = _$_Goods;

  factory _Goods.fromJson(Map<String, dynamic> json) = _$_Goods.fromJson;

  @override
  String get goods_id;
  @override
  String get goods_name;
  @override
  List<String> get imagePath;
  @override
  String get time;
  @override //새상품일 경우 구매 날짜, 중고 상품일 경우 등록 날짜
  String get goods_status;
  @override //새상품, 중고 상품
  String get user_id;
  @override
  @JsonKey(ignore: true)
  _$$_GoodsCopyWith<_$_Goods> get copyWith =>
      throw _privateConstructorUsedError;
}
