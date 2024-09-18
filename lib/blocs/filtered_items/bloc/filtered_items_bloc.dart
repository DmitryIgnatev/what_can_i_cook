import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:what_can_i_cook/models/ingredient.dart';

part 'filtered_items_event.dart';
part 'filtered_items_state.dart';

class FilteredItemsBloc extends Bloc<FilteredItemsEvent, FilteredItemsState> {
  FilteredItemsBloc() : super(FilteredItemsState.initial()) {
    on<FilteredItemsChangedEvent>(_filteredItemsChanged);
  }

  void _filteredItemsChanged(
      FilteredItemsChangedEvent event, Emitter<FilteredItemsState> emit,) {
    emit(state.copyWith(items: event.items));
  }

}
