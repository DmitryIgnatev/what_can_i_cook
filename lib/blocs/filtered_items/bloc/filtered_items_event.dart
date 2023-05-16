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

class FilteredItemChosedEvent extends FilteredItemsEvent {
  final Ingredient ingredient;

  const FilteredItemChosedEvent({required this.ingredient});
}
