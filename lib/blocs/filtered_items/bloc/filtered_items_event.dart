part of 'filtered_items_bloc.dart';

abstract class FilteredItemsEvent extends Equatable {
  const FilteredItemsEvent();

  @override
  List<Object> get props => [];
}

class FilteredItemsChangedEvent extends FilteredItemsEvent {
  final List<Ingredient> items;

  const FilteredItemsChangedEvent({required this.items});
}

class FilteredIndexChangedEvent extends FilteredItemsEvent {
  final int index;

  const FilteredIndexChangedEvent({required this.index});
}
