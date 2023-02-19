// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

History _$HistoryFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
mixin _$History {
  String get goods_id =>
      throw _privateConstructorUsedError; //goods_id로 이미지, when, number를 얻고
  String get user_id =>
      throw _privateConstructorUsedError; //user_id로 who, trust 얻기
  String get goods_image_path => throw _privateConstructorUsedError;
  String get user_image_path => throw _privateConstructorUsedError;
  String get when => throw _privateConstructorUsedError; //년, 월, 일로 받기
  int get number => throw _privateConstructorUsedError;
  String get who => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res>;
  $Res call(
      {String goods_id,
      String user_id,
      String goods_image_path,
      String user_image_path,
      String when,
      int number,
      String who,
      int level});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res> implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  final History _value;
  // ignore: unused_field
  final $Res Function(History) _then;

  @override
  $Res call({
    Object? goods_id = freezed,
    Object? user_id = freezed,
    Object? goods_image_path = freezed,
    Object? user_image_path = freezed,
    Object? when = freezed,
    Object? number = freezed,
    Object? who = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      goods_id: goods_id == freezed
          ? _value.goods_id
          : goods_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      goods_image_path: goods_image_path == freezed
          ? _value.goods_image_path
          : goods_image_path // ignore: cast_nullable_to_non_nullable
              as String,
      user_image_path: user_image_path == freezed
          ? _value.user_image_path
          : user_image_path // ignore: cast_nullable_to_non_nullable
              as String,
      when: when == freezed
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      who: who == freezed
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$_HistoryCopyWith(
          _$_History value, $Res Function(_$_History) then) =
      __$$_HistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String goods_id,
      String user_id,
      String goods_image_path,
      String user_image_path,
      String when,
      int number,
      String who,
      int level});
}

/// @nodoc
class __$$_HistoryCopyWithImpl<$Res> extends _$HistoryCopyWithImpl<$Res>
    implements _$$_HistoryCopyWith<$Res> {
  __$$_HistoryCopyWithImpl(_$_History _value, $Res Function(_$_History) _then)
      : super(_value, (v) => _then(v as _$_History));

  @override
  _$_History get _value => super._value as _$_History;

  @override
  $Res call({
    Object? goods_id = freezed,
    Object? user_id = freezed,
    Object? goods_image_path = freezed,
    Object? user_image_path = freezed,
    Object? when = freezed,
    Object? number = freezed,
    Object? who = freezed,
    Object? level = freezed,
  }) {
    return _then(_$_History(
      goods_id: goods_id == freezed
          ? _value.goods_id
          : goods_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      goods_image_path: goods_image_path == freezed
          ? _value.goods_image_path
          : goods_image_path // ignore: cast_nullable_to_non_nullable
              as String,
      user_image_path: user_image_path == freezed
          ? _value.user_image_path
          : user_image_path // ignore: cast_nullable_to_non_nullable
              as String,
      when: when == freezed
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      who: who == freezed
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_History implements _History {
  _$_History(
      {required this.goods_id,
      required this.user_id,
      required this.goods_image_path,
      required this.user_image_path,
      required this.when,
      required this.number,
      required this.who,
      required this.level});

  factory _$_History.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryFromJson(json);

  @override
  final String goods_id;
//goods_id로 이미지, when, number를 얻고
  @override
  final String user_id;
//user_id로 who, trust 얻기
  @override
  final String goods_image_path;
  @override
  final String user_image_path;
  @override
  final String when;
//년, 월, 일로 받기
  @override
  final int number;
  @override
  final String who;
  @override
  final int level;

  @override
  String toString() {
    return 'History(goods_id: $goods_id, user_id: $user_id, goods_image_path: $goods_image_path, user_image_path: $user_image_path, when: $when, number: $number, who: $who, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_History &&
            const DeepCollectionEquality().equals(other.goods_id, goods_id) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality()
                .equals(other.goods_image_path, goods_image_path) &&
            const DeepCollectionEquality()
                .equals(other.user_image_path, user_image_path) &&
            const DeepCollectionEquality().equals(other.when, when) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.who, who) &&
            const DeepCollectionEquality().equals(other.level, level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(goods_id),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(goods_image_path),
      const DeepCollectionEquality().hash(user_image_path),
      const DeepCollectionEquality().hash(when),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(who),
      const DeepCollectionEquality().hash(level));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryCopyWith<_$_History> get copyWith =>
      __$$_HistoryCopyWithImpl<_$_History>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryToJson(
      this,
    );
  }
}

abstract class _History implements History {
  factory _History(
      {required final String goods_id,
      required final String user_id,
      required final String goods_image_path,
      required final String user_image_path,
      required final String when,
      required final int number,
      required final String who,
      required final int level}) = _$_History;

  factory _History.fromJson(Map<String, dynamic> json) = _$_History.fromJson;

  @override
  String get goods_id;
  @override //goods_id로 이미지, when, number를 얻고
  String get user_id;
  @override //user_id로 who, trust 얻기
  String get goods_image_path;
  @override
  String get user_image_path;
  @override
  String get when;
  @override //년, 월, 일로 받기
  int get number;
  @override
  String get who;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryCopyWith<_$_History> get copyWith =>
      throw _privateConstructorUsedError;
}
