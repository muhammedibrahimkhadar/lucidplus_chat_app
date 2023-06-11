import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chat.dart';
import 'from.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'message_id')
  final int? messageId;
  final From? from;
  final Chat? chat;
  final int? date;
  final String? text;

  const Result({
    this.messageId,
    this.from,
    this.chat,
    this.date,
    this.text,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      messageId.hashCode ^
      from.hashCode ^
      chat.hashCode ^
      date.hashCode ^
      text.hashCode;
}
