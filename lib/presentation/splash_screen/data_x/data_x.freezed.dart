// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_x.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataX _$DataXFromJson(Map<String, dynamic> json) {
  return _DataX.fromJson(json);
}

/// @nodoc
mixin _$DataX {
  String? get status => throw _privateConstructorUsedError;
  List<dynamic>? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataXCopyWith<DataX> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataXCopyWith<$Res> {
  factory $DataXCopyWith(DataX value, $Res Function(DataX) then) =
      _$DataXCopyWithImpl<$Res, DataX>;
  @useResult
  $Res call({String? status, List<dynamic>? message});
}

/// @nodoc
class _$DataXCopyWithImpl<$Res, $Val extends DataX>
    implements $DataXCopyWith<$Res> {
  _$DataXCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataXCopyWith<$Res> implements $DataXCopyWith<$Res> {
  factory _$$_DataXCopyWith(_$_DataX value, $Res Function(_$_DataX) then) =
      __$$_DataXCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, List<dynamic>? message});
}

/// @nodoc
class __$$_DataXCopyWithImpl<$Res> extends _$DataXCopyWithImpl<$Res, _$_DataX>
    implements _$$_DataXCopyWith<$Res> {
  __$$_DataXCopyWithImpl(_$_DataX _value, $Res Function(_$_DataX) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_DataX(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataX implements _DataX {
  _$_DataX({this.status, final List<dynamic>? message}) : _message = message;

  factory _$_DataX.fromJson(Map<String, dynamic> json) =>
      _$$_DataXFromJson(json);

  @override
  final String? status;
  final List<dynamic>? _message;
  @override
  List<dynamic>? get message {
    final value = _message;
    if (value == null) return null;
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataX(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataX &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataXCopyWith<_$_DataX> get copyWith =>
      __$$_DataXCopyWithImpl<_$_DataX>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataXToJson(
      this,
    );
  }
}

abstract class _DataX implements DataX {
  factory _DataX({final String? status, final List<dynamic>? message}) =
      _$_DataX;

  factory _DataX.fromJson(Map<String, dynamic> json) = _$_DataX.fromJson;

  @override
  String? get status;
  @override
  List<dynamic>? get message;
  @override
  @JsonKey(ignore: true)
  _$$_DataXCopyWith<_$_DataX> get copyWith =>
      throw _privateConstructorUsedError;
}
