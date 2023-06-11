import 'package:json_annotation/json_annotation.dart';

part 'from.g.dart';

@JsonSerializable()
class From {
  int? id;
  @JsonKey(name: 'is_bot')
  bool? isBot;
  @JsonKey(name: 'first_name')
  String? firstName;
  String? username;

  From({this.id, this.isBot, this.firstName, this.username});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}
