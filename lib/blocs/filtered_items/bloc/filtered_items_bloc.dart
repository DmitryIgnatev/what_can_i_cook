import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/ingredient.dart';

part 'filtered_items_event.dart';
part 'filtered_items_state.dart';

class FilteredItemsBloc extends Bloc<FilteredItemsEvent, FilteredItemsState> {
  FilteredItemsBloc() : super(FilteredItemsState.initial()) {
    on<FilteredItemsChangedEvent>(_filteredItemsChanged);
    on<FilteredItemChosedEvent>(_filteredIndexChanged);
  }

  void _filteredItemsChanged(
      FilteredItemsChangedEvent event, Emitter<FilteredItemsState> emit) {
    emit(state.copyWith(items: event.items));
  }

  void _filteredIndexChanged(
      FilteredItemChosedEvent event, Emitter<FilteredItemsState> emit) {
    emit(state.copyWith(ingredient: event.ingredient));
  }
}
