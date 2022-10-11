// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'option_selector_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OptionSelectorState<T> {
  int? get selectedIndex => throw _privateConstructorUsedError;
  List<T> get options => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OptionSelectorStateCopyWith<T, OptionSelectorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionSelectorStateCopyWith<T, $Res> {
  factory $OptionSelectorStateCopyWith(OptionSelectorState<T> value,
          $Res Function(OptionSelectorState<T>) then) =
      _$OptionSelectorStateCopyWithImpl<T, $Res>;
  $Res call({int? selectedIndex, List<T> options});
}

/// @nodoc
class _$OptionSelectorStateCopyWithImpl<T, $Res>
    implements $OptionSelectorStateCopyWith<T, $Res> {
  _$OptionSelectorStateCopyWithImpl(this._value, this._then);

  final OptionSelectorState<T> _value;
  // ignore: unused_field
  final $Res Function(OptionSelectorState<T>) _then;

  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
abstract class _$$_OptionSelectorStateCopyWith<T, $Res>
    implements $OptionSelectorStateCopyWith<T, $Res> {
  factory _$$_OptionSelectorStateCopyWith(_$_OptionSelectorState<T> value,
          $Res Function(_$_OptionSelectorState<T>) then) =
      __$$_OptionSelectorStateCopyWithImpl<T, $Res>;
  @override
  $Res call({int? selectedIndex, List<T> options});
}

/// @nodoc
class __$$_OptionSelectorStateCopyWithImpl<T, $Res>
    extends _$OptionSelectorStateCopyWithImpl<T, $Res>
    implements _$$_OptionSelectorStateCopyWith<T, $Res> {
  __$$_OptionSelectorStateCopyWithImpl(_$_OptionSelectorState<T> _value,
      $Res Function(_$_OptionSelectorState<T>) _then)
      : super(_value, (v) => _then(v as _$_OptionSelectorState<T>));

  @override
  _$_OptionSelectorState<T> get _value =>
      super._value as _$_OptionSelectorState<T>;

  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? options = freezed,
  }) {
    return _then(_$_OptionSelectorState<T>(
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      options: options == freezed
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_OptionSelectorState<T> extends _OptionSelectorState<T> {
  const _$_OptionSelectorState(
      {this.selectedIndex, required final List<T> options})
      : _options = options,
        super._();

  @override
  final int? selectedIndex;
  final List<T> _options;
  @override
  List<T> get options {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'OptionSelectorState<$T>(selectedIndex: $selectedIndex, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionSelectorState<T> &&
            const DeepCollectionEquality()
                .equals(other.selectedIndex, selectedIndex) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedIndex),
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  _$$_OptionSelectorStateCopyWith<T, _$_OptionSelectorState<T>> get copyWith =>
      __$$_OptionSelectorStateCopyWithImpl<T, _$_OptionSelectorState<T>>(
          this, _$identity);
}

abstract class _OptionSelectorState<T> extends OptionSelectorState<T> {
  const factory _OptionSelectorState(
      {final int? selectedIndex,
      required final List<T> options}) = _$_OptionSelectorState<T>;
  const _OptionSelectorState._() : super._();

  @override
  int? get selectedIndex;
  @override
  List<T> get options;
  @override
  @JsonKey(ignore: true)
  _$$_OptionSelectorStateCopyWith<T, _$_OptionSelectorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
