// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QueryParams _$QueryParamsFromJson(Map<String, dynamic> json) {
  return _QueryParams.fromJson(json);
}

/// @nodoc
mixin _$QueryParams {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryParamsCopyWith<QueryParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryParamsCopyWith<$Res> {
  factory $QueryParamsCopyWith(
          QueryParams value, $Res Function(QueryParams) then) =
      _$QueryParamsCopyWithImpl<$Res>;
  $Res call({int limit, int offset});
}

/// @nodoc
class _$QueryParamsCopyWithImpl<$Res> implements $QueryParamsCopyWith<$Res> {
  _$QueryParamsCopyWithImpl(this._value, this._then);

  final QueryParams _value;
  // ignore: unused_field
  final $Res Function(QueryParams) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_QueryParamsCopyWith<$Res>
    implements $QueryParamsCopyWith<$Res> {
  factory _$$_QueryParamsCopyWith(
          _$_QueryParams value, $Res Function(_$_QueryParams) then) =
      __$$_QueryParamsCopyWithImpl<$Res>;
  @override
  $Res call({int limit, int offset});
}

/// @nodoc
class __$$_QueryParamsCopyWithImpl<$Res> extends _$QueryParamsCopyWithImpl<$Res>
    implements _$$_QueryParamsCopyWith<$Res> {
  __$$_QueryParamsCopyWithImpl(
      _$_QueryParams _value, $Res Function(_$_QueryParams) _then)
      : super(_value, (v) => _then(v as _$_QueryParams));

  @override
  _$_QueryParams get _value => super._value as _$_QueryParams;

  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$_QueryParams(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryParams implements _QueryParams {
  const _$_QueryParams({this.limit = 10, this.offset = 0});

  factory _$_QueryParams.fromJson(Map<String, dynamic> json) =>
      _$$_QueryParamsFromJson(json);

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'QueryParams(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryParams &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.offset, offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(offset));

  @JsonKey(ignore: true)
  @override
  _$$_QueryParamsCopyWith<_$_QueryParams> get copyWith =>
      __$$_QueryParamsCopyWithImpl<_$_QueryParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryParamsToJson(
      this,
    );
  }
}

abstract class _QueryParams implements QueryParams {
  const factory _QueryParams({final int limit, final int offset}) =
      _$_QueryParams;

  factory _QueryParams.fromJson(Map<String, dynamic> json) =
      _$_QueryParams.fromJson;

  @override
  int get limit;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$_QueryParamsCopyWith<_$_QueryParams> get copyWith =>
      throw _privateConstructorUsedError;
}
