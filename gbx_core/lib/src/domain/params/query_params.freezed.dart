// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QueryParams _$QueryParamsFromJson(Map<String, dynamic> json) {
  return _QueryParams.fromJson(json);
}

/// @nodoc
mixin _$QueryParams {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  /// Serializes this QueryParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueryParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueryParamsCopyWith<QueryParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryParamsCopyWith<$Res> {
  factory $QueryParamsCopyWith(
          QueryParams value, $Res Function(QueryParams) then) =
      _$QueryParamsCopyWithImpl<$Res, QueryParams>;
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class _$QueryParamsCopyWithImpl<$Res, $Val extends QueryParams>
    implements $QueryParamsCopyWith<$Res> {
  _$QueryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueryParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryParamsImplCopyWith<$Res>
    implements $QueryParamsCopyWith<$Res> {
  factory _$$QueryParamsImplCopyWith(
          _$QueryParamsImpl value, $Res Function(_$QueryParamsImpl) then) =
      __$$QueryParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class __$$QueryParamsImplCopyWithImpl<$Res>
    extends _$QueryParamsCopyWithImpl<$Res, _$QueryParamsImpl>
    implements _$$QueryParamsImplCopyWith<$Res> {
  __$$QueryParamsImplCopyWithImpl(
      _$QueryParamsImpl _value, $Res Function(_$QueryParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of QueryParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$QueryParamsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryParamsImpl implements _QueryParams {
  const _$QueryParamsImpl({this.limit = 10, this.offset = 0});

  factory _$QueryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryParamsImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryParamsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  /// Create a copy of QueryParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryParamsImplCopyWith<_$QueryParamsImpl> get copyWith =>
      __$$QueryParamsImplCopyWithImpl<_$QueryParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryParamsImplToJson(
      this,
    );
  }
}

abstract class _QueryParams implements QueryParams {
  const factory _QueryParams({final int limit, final int offset}) =
      _$QueryParamsImpl;

  factory _QueryParams.fromJson(Map<String, dynamic> json) =
      _$QueryParamsImpl.fromJson;

  @override
  int get limit;
  @override
  int get offset;

  /// Create a copy of QueryParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryParamsImplCopyWith<_$QueryParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
