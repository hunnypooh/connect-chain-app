// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) {
  return _ChatItem.fromJson(json);
}

/// @nodoc
mixin _$ChatItem {
  String get profileImagePath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get itemImagePath => throw _privateConstructorUsedError;
  String get messageLatest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatItemCopyWith<ChatItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatItemCopyWith<$Res> {
  factory $ChatItemCopyWith(ChatItem value, $Res Function(ChatItem) then) =
      _$ChatItemCopyWithImpl<$Res>;
  $Res call(
      {String profileImagePath,
      String name,
      String location,
      String time,
      String itemImagePath,
      String messageLatest});
}

/// @nodoc
class _$ChatItemCopyWithImpl<$Res> implements $ChatItemCopyWith<$Res> {
  _$ChatItemCopyWithImpl(this._value, this._then);

  final ChatItem _value;
  // ignore: unused_field
  final $Res Function(ChatItem) _then;

  @override
  $Res call({
    Object? profileImagePath = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? time = freezed,
    Object? itemImagePath = freezed,
    Object? messageLatest = freezed,
  }) {
    return _then(_value.copyWith(
      profileImagePath: profileImagePath == freezed
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      itemImagePath: itemImagePath == freezed
          ? _value.itemImagePath
          : itemImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      messageLatest: messageLatest == freezed
          ? _value.messageLatest
          : messageLatest // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatItemCopyWith<$Res> implements $ChatItemCopyWith<$Res> {
  factory _$$_ChatItemCopyWith(
          _$_ChatItem value, $Res Function(_$_ChatItem) then) =
      __$$_ChatItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String profileImagePath,
      String name,
      String location,
      String time,
      String itemImagePath,
      String messageLatest});
}

/// @nodoc
class __$$_ChatItemCopyWithImpl<$Res> extends _$ChatItemCopyWithImpl<$Res>
    implements _$$_ChatItemCopyWith<$Res> {
  __$$_ChatItemCopyWithImpl(
      _$_ChatItem _value, $Res Function(_$_ChatItem) _then)
      : super(_value, (v) => _then(v as _$_ChatItem));

  @override
  _$_ChatItem get _value => super._value as _$_ChatItem;

  @override
  $Res call({
    Object? profileImagePath = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? time = freezed,
    Object? itemImagePath = freezed,
    Object? messageLatest = freezed,
  }) {
    return _then(_$_ChatItem(
      profileImagePath: profileImagePath == freezed
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      itemImagePath: itemImagePath == freezed
          ? _value.itemImagePath
          : itemImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      messageLatest: messageLatest == freezed
          ? _value.messageLatest
          : messageLatest // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatItem implements _ChatItem {
  _$_ChatItem(
      {required this.profileImagePath,
      required this.name,
      required this.location,
      required this.time,
      required this.itemImagePath,
      required this.messageLatest});

  factory _$_ChatItem.fromJson(Map<String, dynamic> json) =>
      _$$_ChatItemFromJson(json);

  @override
  final String profileImagePath;
  @override
  final String name;
  @override
  final String location;
  @override
  final String time;
  @override
  final String itemImagePath;
  @override
  final String messageLatest;

  @override
  String toString() {
    return 'ChatItem(profileImagePath: $profileImagePath, name: $name, location: $location, time: $time, itemImagePath: $itemImagePath, messageLatest: $messageLatest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatItem &&
            const DeepCollectionEquality()
                .equals(other.profileImagePath, profileImagePath) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.itemImagePath, itemImagePath) &&
            const DeepCollectionEquality()
                .equals(other.messageLatest, messageLatest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profileImagePath),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(itemImagePath),
      const DeepCollectionEquality().hash(messageLatest));

  @JsonKey(ignore: true)
  @override
  _$$_ChatItemCopyWith<_$_ChatItem> get copyWith =>
      __$$_ChatItemCopyWithImpl<_$_ChatItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatItemToJson(
      this,
    );
  }
}

abstract class _ChatItem implements ChatItem {
  factory _ChatItem(
      {required final String profileImagePath,
      required final String name,
      required final String location,
      required final String time,
      required final String itemImagePath,
      required final String messageLatest}) = _$_ChatItem;

  factory _ChatItem.fromJson(Map<String, dynamic> json) = _$_ChatItem.fromJson;

  @override
  String get profileImagePath;
  @override
  String get name;
  @override
  String get location;
  @override
  String get time;
  @override
  String get itemImagePath;
  @override
  String get messageLatest;
  @override
  @JsonKey(ignore: true)
  _$$_ChatItemCopyWith<_$_ChatItem> get copyWith =>
      throw _privateConstructorUsedError;
}
