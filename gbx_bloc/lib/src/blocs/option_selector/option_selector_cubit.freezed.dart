// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_selector_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OptionSelectorState<T> {
  int? get selectedIndex => throw _privateConstructorUsedError;
  List<T> get options => throw _privateConstructorUsedError;

  /// Create a copy of OptionSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionSelectorStateCopyWith<T, OptionSelectorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionSelectorStateCopyWith<T, $Res> {
  factory $OptionSelectorStateCopyWith(OptionSelectorState<T> value,
          $Res Function(OptionSelectorState<T>) then) =
      _$OptionSelectorStateCopyWithImpl<T, $Res, OptionSelectorState<T>>;
  @useResult
  $Res call({int? selectedIndex, List<T> options});
}

/// @nodoc
class _$OptionSelectorStateCopyWithImpl<T, $Res,
        $Val extends OptionSelectorState<T>>
    implements $OptionSelectorStateCopyWith<T, $Res> {
  _$OptionSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionSelectorStateImplCopyWith<T, $Res>
    implements $OptionSelectorStateCopyWith<T, $Res> {
  factory _$$OptionSelectorStateImplCopyWith(_$OptionSelectorStateImpl<T> value,
          $Res Function(_$OptionSelectorStateImpl<T>) then) =
      __$$OptionSelectorStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? selectedIndex, List<T> options});
}

/// @nodoc
class __$$OptionSelectorStateImplCopyWithImpl<T, $Res>
    extends _$OptionSelectorStateCopyWithImpl<T, $Res,
        _$OptionSelectorStateImpl<T>>
    implements _$$OptionSelectorStateImplCopyWith<T, $Res> {
  __$$OptionSelectorStateImplCopyWithImpl(_$OptionSelectorStateImpl<T> _value,
      $Res Function(_$OptionSelectorStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of OptionSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? options = null,
  }) {
    return _then(_$OptionSelectorStateImpl<T>(
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$OptionSelectorStateImpl<T> extends _OptionSelectorState<T> {
  const _$OptionSelectorStateImpl(
      {this.selectedIndex, required final List<T> options})
      : _options = options,
        super._();

  @override
  final int? selectedIndex;
  final List<T> _options;
  @override
  List<T> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'OptionSelectorState<$T>(selectedIndex: $selectedIndex, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionSelectorStateImpl<T> &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of OptionSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionSelectorStateImplCopyWith<T, _$OptionSelectorStateImpl<T>>
      get copyWith => __$$OptionSelectorStateImplCopyWithImpl<T,
          _$OptionSelectorStateImpl<T>>(this, _$identity);
}

abstract class _OptionSelectorState<T> extends OptionSelectorState<T> {
  const factory _OptionSelectorState(
      {final int? selectedIndex,
      required final List<T> options}) = _$OptionSelectorStateImpl<T>;
  const _OptionSelectorState._() : super._();

  @override
  int? get selectedIndex;
  @override
  List<T> get options;

  /// Create a copy of OptionSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionSelectorStateImplCopyWith<T, _$OptionSelectorStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
