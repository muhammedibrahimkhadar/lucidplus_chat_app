import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'telegram_post_image_api_model.freezed.dart';
part 'telegram_post_image_api_model.g.dart';

@freezed
class TelegramPostImageApiModel with _$TelegramPostImageApiModel {
  factory TelegramPostImageApiModel({
    bool? ok,
    Result? result,
  }) = _TelegramPostImageApiModel;

  factory TelegramPostImageApiModel.fromJson(Map<String, dynamic> json) =>
      _$TelegramPostImageApiModelFromJson(json);
}
