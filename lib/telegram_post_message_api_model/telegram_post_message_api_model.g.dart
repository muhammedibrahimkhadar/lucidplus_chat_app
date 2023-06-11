// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_post_message_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramPostMessageApiModel _$TelegramPostMessageApiModelFromJson(
        Map<String, dynamic> json) =>
    TelegramPostMessageApiModel(
      ok: json['ok'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TelegramPostMessageApiModelToJson(
        TelegramPostMessageApiModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'result': instance.result,
    };
