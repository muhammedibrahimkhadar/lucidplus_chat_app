import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'telegram_post_message_api_model.freezed.dart';
part 'telegram_post_message_api_model.g.dart';

@freezed
class TelegramPostMessageApiModel with _$TelegramPostMessageApiModel {
  factory TelegramPostMessageApiModel({
    bool? ok,
    Result? result,
  }) = _TelegramPostMessageApiModel;

  factory TelegramPostMessageApiModel.fromJson(Map<String, dynamic> json) =>
      _$TelegramPostMessageApiModelFromJson(json);
}
