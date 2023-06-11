import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  factory Photo({
    @JsonKey(name: 'file_id') String? fileId,
    @JsonKey(name: 'file_unique_id') String? fileUniqueId,
    @JsonKey(name: 'file_size') int? fileSize,
    int? width,
    int? height,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
