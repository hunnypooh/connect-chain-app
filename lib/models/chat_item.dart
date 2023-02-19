import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_item.freezed.dart';
part 'chat_item.g.dart';

@freezed
class ChatItem with _$ChatItem {
  factory ChatItem({
    required String profileImagePath,
    required String name,
    required String location,
    required String time,
    required String itemImagePath,
    required String messageLatest,
  }) = _ChatItem;

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);
}
