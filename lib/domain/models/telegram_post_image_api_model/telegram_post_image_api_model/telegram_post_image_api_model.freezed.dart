// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telegram_post_image_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TelegramPostImageApiModel _$TelegramPostImageApiModelFromJson(
    Map<String, dynamic> json) {
  return _TelegramPostImageApiModel.fromJson(json);
}

/// @nodoc
mixin _$TelegramPostImageApiModel {
  bool? get ok => throw _privateConstructorUsedError;
  Result? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TelegramPostImageApiModelCopyWith<TelegramPostImageApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelegramPostImageApiModelCopyWith<$Res> {
  factory $TelegramPostImageApiModelCopyWith(TelegramPostImageApiModel value,
          $Res Function(TelegramPostImageApiModel) then) =
      _$TelegramPostImageApiModelCopyWithImpl<$Res, TelegramPostImageApiModel>;
  @useResult
  $Res call({bool? ok, Result? result});

  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$TelegramPostImageApiModelCopyWithImpl<$Res,
        $Val extends TelegramPostImageApiModel>
    implements $TelegramPostImageApiModelCopyWith<$Res> {
  _$TelegramPostImageApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      ok: freezed == ok
          ? _value.ok
          : ok // ignore: cast_nullable_to_non_nullable
              as bool?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TelegramPostImageApiModelCopyWith<$Res>
    implements $TelegramPostImageApiModelCopyWith<$Res> {
  factory _$$_TelegramPostImageApiModelCopyWith(
          _$_TelegramPostImageApiModel value,
          $Res Function(_$_TelegramPostImageApiModel) then) =
      __$$_TelegramPostImageApiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? ok, Result? result});

  @override
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_TelegramPostImageApiModelCopyWithImpl<$Res>
    extends _$TelegramPostImageApiModelCopyWithImpl<$Res,
        _$_TelegramPostImageApiModel>
    implements _$$_TelegramPostImageApiModelCopyWith<$Res> {
  __$$_TelegramPostImageApiModelCopyWithImpl(
      _$_TelegramPostImageApiModel _value,
      $Res Function(_$_TelegramPostImageApiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ok = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_TelegramPostImageApiModel(
      ok: freezed == ok
          ? _value.ok
          : ok // ignore: cast_nullable_to_non_nullable
              as bool?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TelegramPostImageApiModel implements _TelegramPostImageApiModel {
  _$_TelegramPostImageApiModel({this.ok, this.result});

  factory _$_TelegramPostImageApiModel.fromJson(Map<String, dynamic> json) =>
      _$$_TelegramPostImageApiModelFromJson(json);

  @override
  final bool? ok;
  @override
  final Result? result;

  @override
  String toString() {
    return 'TelegramPostImageApiModel(ok: $ok, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TelegramPostImageApiModel &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ok, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TelegramPostImageApiModelCopyWith<_$_TelegramPostImageApiModel>
      get copyWith => __$$_TelegramPostImageApiModelCopyWithImpl<
          _$_TelegramPostImageApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TelegramPostImageApiModelToJson(
      this,
    );
  }
}

abstract class _TelegramPostImageApiModel implements TelegramPostImageApiModel {
  factory _TelegramPostImageApiModel({final bool? ok, final Result? result}) =
      _$_TelegramPostImageApiModel;

  factory _TelegramPostImageApiModel.fromJson(Map<String, dynamic> json) =
      _$_TelegramPostImageApiModel.fromJson;

  @override
  bool? get ok;
  @override
  Result? get result;
  @override
  @JsonKey(ignore: true)
  _$$_TelegramPostImageApiModelCopyWith<_$_TelegramPostImageApiModel>
      get copyWith => throw _privateConstructorUsedError;
}
