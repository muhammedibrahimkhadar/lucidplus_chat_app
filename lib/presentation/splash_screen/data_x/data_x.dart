import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_x.freezed.dart';
part 'data_x.g.dart';

@freezed
class DataX with _$DataX {
  factory DataX({
    String? status,
    List<dynamic>? message,
  }) = _DataX;

  factory DataX.fromJson(Map<String, dynamic> json) => _$DataXFromJson(json);
}
