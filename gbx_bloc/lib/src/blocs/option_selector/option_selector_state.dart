part of 'option_selector_cubit.dart';

@freezed
class OptionSelectorState<T> with _$OptionSelectorState<T> {
  const factory OptionSelectorState(
      {int? selectedIndex, required List<T> options}) = _OptionSelectorState;

  const OptionSelectorState._();

  T? get selectedOption =>
      selectedIndex != null ? options[selectedIndex!] : null;
}
