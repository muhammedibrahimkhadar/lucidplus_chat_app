import 'package:json_annotation/json_annotation.dart';

import 'chat.dart';
import 'from.dart';
import 'photo.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'message_id')
  int? messageId;
  From? from;
  Chat? chat;
  int? date;
  List<Photo>? photo;

  Result({this.messageId, this.from, this.chat, this.date, this.photo});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
