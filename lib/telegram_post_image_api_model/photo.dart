import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'file_id')
  String? fileId;
  @JsonKey(name: 'file_unique_id')
  String? fileUniqueId;
  @JsonKey(name: 'file_size')
  int? fileSize;
  int? width;
  int? height;

  Photo({
    this.fileId,
    this.fileUniqueId,
    this.fileSize,
    this.width,
    this.height,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
