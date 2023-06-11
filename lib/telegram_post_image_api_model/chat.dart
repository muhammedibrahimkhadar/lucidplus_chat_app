import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  int? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  String? type;

  Chat({this.id, this.firstName, this.type});

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
