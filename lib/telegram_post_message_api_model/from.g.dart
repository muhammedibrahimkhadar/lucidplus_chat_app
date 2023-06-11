// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

From _$FromFromJson(Map<String, dynamic> json) => From(
      id: json['id'] as int?,
      isBot: json['is_bot'] as bool?,
      firstName: json['first_name'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'id': instance.id,
      'is_bot': instance.isBot,
      'first_name': instance.firstName,
      'username': instance.username,
    };
