// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult Function(String path)? asset,
    TResult Function(String url)? network,
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
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSourceCopyWith<$Res> {
  factory $ImageSourceCopyWith(
          ImageSource value, $Res Function(ImageSource) then) =
      _$ImageSourceCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageSourceCopyWithImpl<$Res> implements $ImageSourceCopyWith<$Res> {
  _$ImageSourceCopyWithImpl(this._value, this._then);

  final ImageSource _value;
  // ignore: unused_field
  final $Res Function(ImageSource) _then;
}

/// @nodoc
abstract class _$$AssetImageSourceCopyWith<$Res> {
  factory _$$AssetImageSourceCopyWith(
          _$AssetImageSource value, $Res Function(_$AssetImageSource) then) =
      __$$AssetImageSourceCopyWithImpl<$Res>;
  $Res call({String path});
}

/// @nodoc
class __$$AssetImageSourceCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res>
    implements _$$AssetImageSourceCopyWith<$Res> {
  __$$AssetImageSourceCopyWithImpl(
      _$AssetImageSource _value, $Res Function(_$AssetImageSource) _then)
      : super(_value, (v) => _then(v as _$AssetImageSource));

  @override
  _$AssetImageSource get _value => super._value as _$AssetImageSource;

  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_$AssetImageSource(
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@ImageSourceConverter()
class _$AssetImageSource extends AssetImageSource {
  const _$AssetImageSource(this.path, {final String? $type})
      : $type = $type ?? 'asset',
        super._();

  factory _$AssetImageSource.fromJson(Map<String, dynamic> json) =>
      _$$AssetImageSourceFromJson(json);

  @override
  final String path;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImageSource.asset(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImageSource &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$AssetImageSourceCopyWith<_$AssetImageSource> get copyWith =>
      __$$AssetImageSourceCopyWithImpl<_$AssetImageSource>(this, _$identity);

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
    TResult Function(String path)? asset,
    TResult Function(String url)? network,
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
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
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
    return _$$AssetImageSourceToJson(
      this,
    );
  }
}

abstract class AssetImageSource extends ImageSource {
  const factory AssetImageSource(final String path) = _$AssetImageSource;
  const AssetImageSource._() : super._();

  factory AssetImageSource.fromJson(Map<String, dynamic> json) =
      _$AssetImageSource.fromJson;

  String get path;
  @JsonKey(ignore: true)
  _$$AssetImageSourceCopyWith<_$AssetImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkImageSourceCopyWith<$Res> {
  factory _$$NetworkImageSourceCopyWith(_$NetworkImageSource value,
          $Res Function(_$NetworkImageSource) then) =
      __$$NetworkImageSourceCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class __$$NetworkImageSourceCopyWithImpl<$Res>
    extends _$ImageSourceCopyWithImpl<$Res>
    implements _$$NetworkImageSourceCopyWith<$Res> {
  __$$NetworkImageSourceCopyWithImpl(
      _$NetworkImageSource _value, $Res Function(_$NetworkImageSource) _then)
      : super(_value, (v) => _then(v as _$NetworkImageSource));

  @override
  _$NetworkImageSource get _value => super._value as _$NetworkImageSource;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$NetworkImageSource(
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@ImageSourceConverter()
class _$NetworkImageSource extends NetworkImageSource {
  const _$NetworkImageSource(this.url, {final String? $type})
      : $type = $type ?? 'network',
        super._();

  factory _$NetworkImageSource.fromJson(Map<String, dynamic> json) =>
      _$$NetworkImageSourceFromJson(json);

  @override
  final String url;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ImageSource.network(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImageSource &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$NetworkImageSourceCopyWith<_$NetworkImageSource> get copyWith =>
      __$$NetworkImageSourceCopyWithImpl<_$NetworkImageSource>(
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
    TResult Function(String path)? asset,
    TResult Function(String url)? network,
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
    TResult Function(AssetImageSource value)? asset,
    TResult Function(NetworkImageSource value)? network,
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
    return _$$NetworkImageSourceToJson(
      this,
    );
  }
}

abstract class NetworkImageSource extends ImageSource {
  const factory NetworkImageSource(final String url) = _$NetworkImageSource;
  const NetworkImageSource._() : super._();

  factory NetworkImageSource.fromJson(Map<String, dynamic> json) =
      _$NetworkImageSource.fromJson;

  String get url;
  @JsonKey(ignore: true)
  _$$NetworkImageSourceCopyWith<_$NetworkImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}
