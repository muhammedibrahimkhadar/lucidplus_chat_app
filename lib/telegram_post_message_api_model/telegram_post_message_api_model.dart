import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'telegram_post_message_api_model.g.dart';

@JsonSerializable()
class TelegramPostMessageApiModel {
  final bool? ok;
  final Result? result;

  const TelegramPostMessageApiModel({this.ok, this.result});

  factory TelegramPostMessageApiModel.fromJson(Map<String, dynamic> json) {
    return _$TelegramPostMessageApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TelegramPostMessageApiModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TelegramPostMessageApiModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => ok.hashCode ^ result.hashCode;
}
