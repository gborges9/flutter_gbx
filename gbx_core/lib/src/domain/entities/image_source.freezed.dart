// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageSource _$ImageSourceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'asset':
      return AssetImageSource.fromJson(json);
    case 'network':
      return NetworkImageSource.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ImageSource',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ImageSource {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) asset,
    required TResult Function(String url) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? asset,
    TResult? Function(String url)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? asset,
    TResult Function(String url)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetImageSource value) asset,
    required TResult Function(NetworkImageSource value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetImageSource value)? asset,
    TResult? Function(NetworkImageSource value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ImageSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSourceCopyWith<$Res> {
  factory $ImageSourceCopyWith(
          ImageSource value, $Res Function(ImageSource) then) =
      _$ImageSourceCopyWithImpl<$Res, ImageSource>;
}

/// @nodoc
class _$ImageSourceCopyWithImpl<$Res, $Val extends ImageSource>
    implements $ImageSourceCopyWith<$Res> {
  _$ImageSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AssetImageSourceImplCopyWith<$Res> {
  factory _$$AssetImageSourceImplCopyWith(_$AssetImageSourceImpl value,
          $Res Function(_$AssetImageSourceImpl) then) =
      __$$AssetImageSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$AssetImageSourceImplCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res, _$AssetImageSourceImpl>
    implements _$$AssetImageSourceImplCopyWith<$Res> {
  __$$AssetImageSourceImplCopyWithImpl(_$AssetImageSourceImpl _value,
      $Res Function(_$AssetImageSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$AssetImageSourceImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@ImageSourceConverter()
class _$AssetImageSourceImpl extends AssetImageSource {
  const _$AssetImageSourceImpl(this.path, {final String? $type})
      : $type = $type ?? 'asset',
        super._();

  factory _$AssetImageSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImageSourceImplFromJson(json);

  @override
  final String path;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImageSource.asset(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImageSourceImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImageSourceImplCopyWith<_$AssetImageSourceImpl> get copyWith =>
      __$$AssetImageSourceImplCopyWithImpl<_$AssetImageSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) asset,
    required TResult Function(String url) network,
  }) {
    return asset(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? asset,
    TResult? Function(String url)? network,
  }) {
    return asset?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? asset,
    TResult Function(String url)? network,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetImageSource value) asset,
    required TResult Function(NetworkImageSource value) network,
  }) {
    return asset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetImageSource value)? asset,
    TResult? Function(NetworkImageSource value)? network,
  }) {
    return asset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImageSourceImplToJson(
      this,
    );
  }
}

abstract class AssetImageSource extends ImageSource {
  const factory AssetImageSource(final String path) = _$AssetImageSourceImpl;
  const AssetImageSource._() : super._();

  factory AssetImageSource.fromJson(Map<String, dynamic> json) =
      _$AssetImageSourceImpl.fromJson;

  String get path;

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetImageSourceImplCopyWith<_$AssetImageSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkImageSourceImplCopyWith<$Res> {
  factory _$$NetworkImageSourceImplCopyWith(_$NetworkImageSourceImpl value,
          $Res Function(_$NetworkImageSourceImpl) then) =
      __$$NetworkImageSourceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$NetworkImageSourceImplCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res, _$NetworkImageSourceImpl>
    implements _$$NetworkImageSourceImplCopyWith<$Res> {
  __$$NetworkImageSourceImplCopyWithImpl(_$NetworkImageSourceImpl _value,
      $Res Function(_$NetworkImageSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$NetworkImageSourceImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@ImageSourceConverter()
class _$NetworkImageSourceImpl extends NetworkImageSource {
  const _$NetworkImageSourceImpl(this.url, {final String? $type})
      : $type = $type ?? 'network',
        super._();

  factory _$NetworkImageSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkImageSourceImplFromJson(json);

  @override
  final String url;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImageSource.network(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImageSourceImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImageSourceImplCopyWith<_$NetworkImageSourceImpl> get copyWith =>
      __$$NetworkImageSourceImplCopyWithImpl<_$NetworkImageSourceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) asset,
    required TResult Function(String url) network,
  }) {
    return network(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? asset,
    TResult? Function(String url)? network,
  }) {
    return network?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? asset,
    TResult Function(String url)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetImageSource value) asset,
    required TResult Function(NetworkImageSource value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetImageSource value)? asset,
    TResult? Function(NetworkImageSource value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkImageSourceImplToJson(
      this,
    );
  }
}

abstract class NetworkImageSource extends ImageSource {
  const factory NetworkImageSource(final String url) = _$NetworkImageSourceImpl;
  const NetworkImageSource._() : super._();

  factory NetworkImageSource.fromJson(Map<String, dynamic> json) =
      _$NetworkImageSourceImpl.fromJson;

  String get url;

  /// Create a copy of ImageSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkImageSourceImplCopyWith<_$NetworkImageSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
