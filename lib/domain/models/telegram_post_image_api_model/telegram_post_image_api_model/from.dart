import 'package:freezed_annotation/freezed_annotation.dart';

part 'from.freezed.dart';
part 'from.g.dart';

@freezed
class From with _$From {
  factory From({
    int? id,
    @JsonKey(name: 'is_bot') bool? isBot,
    @JsonKey(name: 'first_name') String? firstName,
    String? username,
  }) = _From;

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);
}
