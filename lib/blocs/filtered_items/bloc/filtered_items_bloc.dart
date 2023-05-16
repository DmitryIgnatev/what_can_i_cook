import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/ingredient.dart';

part 'filtered_items_event.dart';
part 'filtered_items_state.dart';

class FilteredItemsBloc extends Bloc<FilteredItemsEvent, FilteredItemsState> {
  FilteredItemsBloc() : super(FilteredItemsState.initial()) {
    on<FilteredItemsChangedEvent>(_filteredItemsChanged);
    on<FilteredIndexChangedEvent>(_filteredIndexChanged);
  }

  void _filteredItemsChanged(
      FilteredItemsChangedEvent event, Emitter<FilteredItemsState> emit) {
    emit(state.copyWith(items: event.items));
  }

  void _filteredIndexChanged(
      FilteredIndexChangedEvent event, Emitter<FilteredItemsState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
