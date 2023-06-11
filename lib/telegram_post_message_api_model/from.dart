import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'from.g.dart';

@JsonSerializable()
class From {
  final int? id;
  @JsonKey(name: 'is_bot')
  final bool? isBot;
  @JsonKey(name: 'first_name')
  final String? firstName;
  final String? username;

  const From({this.id, this.isBot, this.firstName, this.username});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! From) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ isBot.hashCode ^ firstName.hashCode ^ username.hashCode;
}
