import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat.dart';
import 'from.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    @JsonKey(name: 'message_id') int? messageId,
    From? from,
    Chat? chat,
    int? date,
    String? text,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
