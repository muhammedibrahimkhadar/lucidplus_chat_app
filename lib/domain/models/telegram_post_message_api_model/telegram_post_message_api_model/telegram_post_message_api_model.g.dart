// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_post_message_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TelegramPostMessageApiModel _$$_TelegramPostMessageApiModelFromJson(
        Map<String, dynamic> json) =>
    _$_TelegramPostMessageApiModel(
      ok: json['ok'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TelegramPostMessageApiModelToJson(
        _$_TelegramPostMessageApiModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'result': instance.result,
    };
