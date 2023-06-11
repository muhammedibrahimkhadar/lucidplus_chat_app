// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'from.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

From _$FromFromJson(Map<String, dynamic> json) {
  return _From.fromJson(json);
}

/// @nodoc
mixin _$From {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bot')
  bool? get isBot => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromCopyWith<From> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromCopyWith<$Res> {
  factory $FromCopyWith(From value, $Res Function(From) then) =
      _$FromCopyWithImpl<$Res, From>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'is_bot') bool? isBot,
      @JsonKey(name: 'first_name') String? firstName,
      String? username});
}

/// @nodoc
class _$FromCopyWithImpl<$Res, $Val extends From>
    implements $FromCopyWith<$Res> {
  _$FromCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isBot = freezed,
    Object? firstName = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isBot: freezed == isBot
          ? _value.isBot
          : isBot // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FromCopyWith<$Res> implements $FromCopyWith<$Res> {
  factory _$$_FromCopyWith(_$_From value, $Res Function(_$_From) then) =
      __$$_FromCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'is_bot') bool? isBot,
      @JsonKey(name: 'first_name') String? firstName,
      String? username});
}

/// @nodoc
class __$$_FromCopyWithImpl<$Res> extends _$FromCopyWithImpl<$Res, _$_From>
    implements _$$_FromCopyWith<$Res> {
  __$$_FromCopyWithImpl(_$_From _value, $Res Function(_$_From) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isBot = freezed,
    Object? firstName = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_From(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isBot: freezed == isBot
          ? _value.isBot
          : isBot // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_From implements _From {
  _$_From(
      {this.id,
      @JsonKey(name: 'is_bot') this.isBot,
      @JsonKey(name: 'first_name') this.firstName,
      this.username});

  factory _$_From.fromJson(Map<String, dynamic> json) => _$$_FromFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'is_bot')
  final bool? isBot;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  final String? username;

  @override
  String toString() {
    return 'From(id: $id, isBot: $isBot, firstName: $firstName, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_From &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isBot, isBot) || other.isBot == isBot) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isBot, firstName, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FromCopyWith<_$_From> get copyWith =>
      __$$_FromCopyWithImpl<_$_From>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FromToJson(
      this,
    );
  }
}

abstract class _From implements From {
  factory _From(
      {final int? id,
      @JsonKey(name: 'is_bot') final bool? isBot,
      @JsonKey(name: 'first_name') final String? firstName,
      final String? username}) = _$_From;

  factory _From.fromJson(Map<String, dynamic> json) = _$_From.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'is_bot')
  bool? get isBot;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$_FromCopyWith<_$_From> get copyWith => throw _privateConstructorUsedError;
}
