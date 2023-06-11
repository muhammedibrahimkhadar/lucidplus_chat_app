import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'telegram_post_image_api_model.g.dart';

@JsonSerializable()
class TelegramPostImageApiModel {
  bool? ok;
  Result? result;

  TelegramPostImageApiModel({this.ok, this.result});

  factory TelegramPostImageApiModel.fromJson(Map<String, dynamic> json) {
    return _$TelegramPostImageApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TelegramPostImageApiModelToJson(this);
}
