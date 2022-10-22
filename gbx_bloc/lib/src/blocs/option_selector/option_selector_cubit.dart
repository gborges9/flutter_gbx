import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_selector_state.dart';
part 'option_selector_cubit.freezed.dart';

class OptionSelectorCubit<T> extends Cubit<OptionSelectorState<T>> {
  OptionSelectorCubit({required List<T> options, int? selectedIndex})
      : super(
          OptionSelectorState(
            options: options,
            selectedIndex: selectedIndex,
          ),
        );

  void setOptions(List<T> options, [int? selectedIndex = -1]) {
    if (selectedIndex == -1) {
      T? lastSelected = state.selectedOption;

      if (lastSelected != null && options.contains(lastSelected)) {
        selectedIndex = options.indexOf(lastSelected);
      }
    }

    emit(state.copyWith(options: options, selectedIndex: selectedIndex));
  }

  void setSelected(int? selectedIndex) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}
