// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_post_image_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TelegramPostImageApiModel _$TelegramPostImageApiModelFromJson(
        Map<String, dynamic> json) =>
    TelegramPostImageApiModel(
      ok: json['ok'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TelegramPostImageApiModelToJson(
        TelegramPostImageApiModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'result': instance.result,
    };
