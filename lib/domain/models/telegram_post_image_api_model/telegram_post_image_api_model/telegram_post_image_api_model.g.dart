// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telegram_post_image_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TelegramPostImageApiModel _$$_TelegramPostImageApiModelFromJson(
        Map<String, dynamic> json) =>
    _$_TelegramPostImageApiModel(
      ok: json['ok'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TelegramPostImageApiModelToJson(
        _$_TelegramPostImageApiModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'result': instance.result,
    };
