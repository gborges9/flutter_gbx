// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remote_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoteListState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteListStateCopyWith<T, $Res> {
  factory $RemoteListStateCopyWith(
          RemoteListState<T> value, $Res Function(RemoteListState<T>) then) =
      _$RemoteListStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RemoteListStateCopyWithImpl<T, $Res>
    implements $RemoteListStateCopyWith<T, $Res> {
  _$RemoteListStateCopyWithImpl(this._value, this._then);

  final RemoteListState<T> _value;
  // ignore: unused_field
  final $Res Function(RemoteListState<T>) _then;
}

/// @nodoc
abstract class _$$RemoteListUninitializedCopyWith<T, $Res> {
  factory _$$RemoteListUninitializedCopyWith(_$RemoteListUninitialized<T> value,
          $Res Function(_$RemoteListUninitialized<T>) then) =
      __$$RemoteListUninitializedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RemoteListUninitializedCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListUninitializedCopyWith<T, $Res> {
  __$$RemoteListUninitializedCopyWithImpl(_$RemoteListUninitialized<T> _value,
      $Res Function(_$RemoteListUninitialized<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListUninitialized<T>));

  @override
  _$RemoteListUninitialized<T> get _value =>
      super._value as _$RemoteListUninitialized<T>;
}

/// @nodoc

class _$RemoteListUninitialized<T> extends RemoteListUninitialized<T> {
  const _$RemoteListUninitialized() : super._();

  @override
  String toString() {
    return 'RemoteListState<$T>.uninitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListUninitialized<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class RemoteListUninitialized<T> extends RemoteListState<T>
    implements UninitialiazedState {
  const factory RemoteListUninitialized() = _$RemoteListUninitialized<T>;
  const RemoteListUninitialized._() : super._();
}

/// @nodoc
abstract class _$$RemoteListInitialFetchingCopyWith<T, $Res> {
  factory _$$RemoteListInitialFetchingCopyWith(
          _$RemoteListInitialFetching<T> value,
          $Res Function(_$RemoteListInitialFetching<T>) then) =
      __$$RemoteListInitialFetchingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RemoteListInitialFetchingCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListInitialFetchingCopyWith<T, $Res> {
  __$$RemoteListInitialFetchingCopyWithImpl(
      _$RemoteListInitialFetching<T> _value,
      $Res Function(_$RemoteListInitialFetching<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListInitialFetching<T>));

  @override
  _$RemoteListInitialFetching<T> get _value =>
      super._value as _$RemoteListInitialFetching<T>;
}

/// @nodoc

class _$RemoteListInitialFetching<T> extends RemoteListInitialFetching<T> {
  const _$RemoteListInitialFetching() : super._();

  @override
  String toString() {
    return 'RemoteListState<$T>.initialFetching()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListInitialFetching<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return initialFetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return initialFetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (initialFetching != null) {
      return initialFetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return initialFetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return initialFetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (initialFetching != null) {
      return initialFetching(this);
    }
    return orElse();
  }
}

abstract class RemoteListInitialFetching<T> extends RemoteListState<T>
    implements LoadingState {
  const factory RemoteListInitialFetching() = _$RemoteListInitialFetching<T>;
  const RemoteListInitialFetching._() : super._();
}

/// @nodoc
abstract class _$$RemoteListFetchingMoreCopyWith<T, $Res> {
  factory _$$RemoteListFetchingMoreCopyWith(_$RemoteListFetchingMore<T> value,
          $Res Function(_$RemoteListFetchingMore<T>) then) =
      __$$RemoteListFetchingMoreCopyWithImpl<T, $Res>;
  $Res call({List<T> values});
}

/// @nodoc
class __$$RemoteListFetchingMoreCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListFetchingMoreCopyWith<T, $Res> {
  __$$RemoteListFetchingMoreCopyWithImpl(_$RemoteListFetchingMore<T> _value,
      $Res Function(_$RemoteListFetchingMore<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListFetchingMore<T>));

  @override
  _$RemoteListFetchingMore<T> get _value =>
      super._value as _$RemoteListFetchingMore<T>;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_$RemoteListFetchingMore<T>(
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$RemoteListFetchingMore<T> extends RemoteListFetchingMore<T> {
  const _$RemoteListFetchingMore({required final List<T> values})
      : _values = values,
        super._();

  final List<T> _values;
  @override
  List<T> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'RemoteListState<$T>.fetchingMore(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListFetchingMore<T> &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  _$$RemoteListFetchingMoreCopyWith<T, _$RemoteListFetchingMore<T>>
      get copyWith => __$$RemoteListFetchingMoreCopyWithImpl<T,
          _$RemoteListFetchingMore<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return fetchingMore(values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return fetchingMore?.call(values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (fetchingMore != null) {
      return fetchingMore(values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return fetchingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return fetchingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchingMore != null) {
      return fetchingMore(this);
    }
    return orElse();
  }
}

abstract class RemoteListFetchingMore<T> extends RemoteListState<T>
    implements LoadingState, InitializedRemoteListState<dynamic> {
  const factory RemoteListFetchingMore({required final List<T> values}) =
      _$RemoteListFetchingMore<T>;
  const RemoteListFetchingMore._() : super._();

  List<T> get values;
  @JsonKey(ignore: true)
  _$$RemoteListFetchingMoreCopyWith<T, _$RemoteListFetchingMore<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteListRefreshingCopyWith<T, $Res> {
  factory _$$RemoteListRefreshingCopyWith(_$RemoteListRefreshing<T> value,
          $Res Function(_$RemoteListRefreshing<T>) then) =
      __$$RemoteListRefreshingCopyWithImpl<T, $Res>;
  $Res call({List<T>? values});
}

/// @nodoc
class __$$RemoteListRefreshingCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListRefreshingCopyWith<T, $Res> {
  __$$RemoteListRefreshingCopyWithImpl(_$RemoteListRefreshing<T> _value,
      $Res Function(_$RemoteListRefreshing<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListRefreshing<T>));

  @override
  _$RemoteListRefreshing<T> get _value =>
      super._value as _$RemoteListRefreshing<T>;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_$RemoteListRefreshing<T>(
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc

class _$RemoteListRefreshing<T> extends RemoteListRefreshing<T> {
  const _$RemoteListRefreshing({final List<T>? values})
      : _values = values,
        super._();

  final List<T>? _values;
  @override
  List<T>? get values {
    final value = _values;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RemoteListState<$T>.refreshing(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListRefreshing<T> &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  _$$RemoteListRefreshingCopyWith<T, _$RemoteListRefreshing<T>> get copyWith =>
      __$$RemoteListRefreshingCopyWithImpl<T, _$RemoteListRefreshing<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return refreshing(values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return refreshing?.call(values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class RemoteListRefreshing<T> extends RemoteListState<T>
    implements LoadingState {
  const factory RemoteListRefreshing({final List<T>? values}) =
      _$RemoteListRefreshing<T>;
  const RemoteListRefreshing._() : super._();

  List<T>? get values;
  @JsonKey(ignore: true)
  _$$RemoteListRefreshingCopyWith<T, _$RemoteListRefreshing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteListLoadedCopyWith<T, $Res> {
  factory _$$RemoteListLoadedCopyWith(_$RemoteListLoaded<T> value,
          $Res Function(_$RemoteListLoaded<T>) then) =
      __$$RemoteListLoadedCopyWithImpl<T, $Res>;
  $Res call({List<T> values});
}

/// @nodoc
class __$$RemoteListLoadedCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListLoadedCopyWith<T, $Res> {
  __$$RemoteListLoadedCopyWithImpl(
      _$RemoteListLoaded<T> _value, $Res Function(_$RemoteListLoaded<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListLoaded<T>));

  @override
  _$RemoteListLoaded<T> get _value => super._value as _$RemoteListLoaded<T>;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_$RemoteListLoaded<T>(
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$RemoteListLoaded<T> extends RemoteListLoaded<T> {
  const _$RemoteListLoaded({required final List<T> values})
      : _values = values,
        super._();

  final List<T> _values;
  @override
  List<T> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'RemoteListState<$T>.loaded(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListLoaded<T> &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  _$$RemoteListLoadedCopyWith<T, _$RemoteListLoaded<T>> get copyWith =>
      __$$RemoteListLoadedCopyWithImpl<T, _$RemoteListLoaded<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return loaded(values);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return loaded?.call(values);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(values);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RemoteListLoaded<T> extends RemoteListState<T>
    implements InitializedRemoteListState<dynamic> {
  const factory RemoteListLoaded({required final List<T> values}) =
      _$RemoteListLoaded<T>;
  const RemoteListLoaded._() : super._();

  List<T> get values;
  @JsonKey(ignore: true)
  _$$RemoteListLoadedCopyWith<T, _$RemoteListLoaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteListInitialFetchErrorCopyWith<T, $Res> {
  factory _$$RemoteListInitialFetchErrorCopyWith(
          _$RemoteListInitialFetchError<T> value,
          $Res Function(_$RemoteListInitialFetchError<T>) then) =
      __$$RemoteListInitialFetchErrorCopyWithImpl<T, $Res>;
  $Res call({String? message, dynamic error, StackTrace? stackTrace});
}

/// @nodoc
class __$$RemoteListInitialFetchErrorCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListInitialFetchErrorCopyWith<T, $Res> {
  __$$RemoteListInitialFetchErrorCopyWithImpl(
      _$RemoteListInitialFetchError<T> _value,
      $Res Function(_$RemoteListInitialFetchError<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListInitialFetchError<T>));

  @override
  _$RemoteListInitialFetchError<T> get _value =>
      super._value as _$RemoteListInitialFetchError<T>;

  @override
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$RemoteListInitialFetchError<T>(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$RemoteListInitialFetchError<T> extends RemoteListInitialFetchError<T> {
  const _$RemoteListInitialFetchError(
      {this.message, this.error, this.stackTrace})
      : super._();

  @override
  final String? message;
  @override
  final dynamic error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RemoteListState<$T>.initialFetchError(message: $message, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListInitialFetchError<T> &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$RemoteListInitialFetchErrorCopyWith<T, _$RemoteListInitialFetchError<T>>
      get copyWith => __$$RemoteListInitialFetchErrorCopyWithImpl<T,
          _$RemoteListInitialFetchError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return initialFetchError(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return initialFetchError?.call(message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (initialFetchError != null) {
      return initialFetchError(message, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return initialFetchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return initialFetchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (initialFetchError != null) {
      return initialFetchError(this);
    }
    return orElse();
  }
}

abstract class RemoteListInitialFetchError<T> extends RemoteListState<T>
    implements TemporaryErrorState {
  const factory RemoteListInitialFetchError(
      {final String? message,
      final dynamic error,
      final StackTrace? stackTrace}) = _$RemoteListInitialFetchError<T>;
  const RemoteListInitialFetchError._() : super._();

  String? get message;
  dynamic get error;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$RemoteListInitialFetchErrorCopyWith<T, _$RemoteListInitialFetchError<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteListFetchErrorCopyWith<T, $Res> {
  factory _$$RemoteListFetchErrorCopyWith(_$RemoteListFetchError<T> value,
          $Res Function(_$RemoteListFetchError<T>) then) =
      __$$RemoteListFetchErrorCopyWithImpl<T, $Res>;
  $Res call(
      {List<T> values, String? message, dynamic error, StackTrace? stackTrace});
}

/// @nodoc
class __$$RemoteListFetchErrorCopyWithImpl<T, $Res>
    extends _$RemoteListStateCopyWithImpl<T, $Res>
    implements _$$RemoteListFetchErrorCopyWith<T, $Res> {
  __$$RemoteListFetchErrorCopyWithImpl(_$RemoteListFetchError<T> _value,
      $Res Function(_$RemoteListFetchError<T>) _then)
      : super(_value, (v) => _then(v as _$RemoteListFetchError<T>));

  @override
  _$RemoteListFetchError<T> get _value =>
      super._value as _$RemoteListFetchError<T>;

  @override
  $Res call({
    Object? values = freezed,
    Object? message = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$RemoteListFetchError<T>(
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<T>,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$RemoteListFetchError<T> extends RemoteListFetchError<T> {
  const _$RemoteListFetchError(
      {required final List<T> values,
      this.message,
      this.error,
      this.stackTrace})
      : _values = values,
        super._();

  final List<T> _values;
  @override
  List<T> get values {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final String? message;
  @override
  final dynamic error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RemoteListState<$T>.fetchError(values: $values, message: $message, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteListFetchError<T> &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_values),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$RemoteListFetchErrorCopyWith<T, _$RemoteListFetchError<T>> get copyWith =>
      __$$RemoteListFetchErrorCopyWithImpl<T, _$RemoteListFetchError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialFetching,
    required TResult Function(List<T> values) fetchingMore,
    required TResult Function(List<T>? values) refreshing,
    required TResult Function(List<T> values) loaded,
    required TResult Function(
            String? message, dynamic error, StackTrace? stackTrace)
        initialFetchError,
    required TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)
        fetchError,
  }) {
    return fetchError(values, message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
  }) {
    return fetchError?.call(values, message, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialFetching,
    TResult Function(List<T> values)? fetchingMore,
    TResult Function(List<T>? values)? refreshing,
    TResult Function(List<T> values)? loaded,
    TResult Function(String? message, dynamic error, StackTrace? stackTrace)?
        initialFetchError,
    TResult Function(List<T> values, String? message, dynamic error,
            StackTrace? stackTrace)?
        fetchError,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(values, message, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoteListUninitialized<T> value) uninitialized,
    required TResult Function(RemoteListInitialFetching<T> value)
        initialFetching,
    required TResult Function(RemoteListFetchingMore<T> value) fetchingMore,
    required TResult Function(RemoteListRefreshing<T> value) refreshing,
    required TResult Function(RemoteListLoaded<T> value) loaded,
    required TResult Function(RemoteListInitialFetchError<T> value)
        initialFetchError,
    required TResult Function(RemoteListFetchError<T> value) fetchError,
  }) {
    return fetchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
  }) {
    return fetchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteListUninitialized<T> value)? uninitialized,
    TResult Function(RemoteListInitialFetching<T> value)? initialFetching,
    TResult Function(RemoteListFetchingMore<T> value)? fetchingMore,
    TResult Function(RemoteListRefreshing<T> value)? refreshing,
    TResult Function(RemoteListLoaded<T> value)? loaded,
    TResult Function(RemoteListInitialFetchError<T> value)? initialFetchError,
    TResult Function(RemoteListFetchError<T> value)? fetchError,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(this);
    }
    return orElse();
  }
}

abstract class RemoteListFetchError<T> extends RemoteListState<T>
    implements TemporaryErrorState {
  const factory RemoteListFetchError(
      {required final List<T> values,
      final String? message,
      final dynamic error,
      final StackTrace? stackTrace}) = _$RemoteListFetchError<T>;
  const RemoteListFetchError._() : super._();

  List<T> get values;
  String? get message;
  dynamic get error;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$RemoteListFetchErrorCopyWith<T, _$RemoteListFetchError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
