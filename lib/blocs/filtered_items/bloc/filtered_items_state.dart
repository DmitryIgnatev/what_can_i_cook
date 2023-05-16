part of 'filtered_items_bloc.dart';

class FilteredItemsState extends Equatable {
  final List<Ingredient> items;
  final int index;
  const FilteredItemsState({required this.items, required this.index});

  factory FilteredItemsState.initial() =>
      FilteredItemsState(items: [], index: 0);

  FilteredItemsState copyWith({List<Ingredient>? items, int? index}) {
    return FilteredItemsState(
        items: items ?? this.items, index: index ?? this.index);
  }

  @override
  List<Object> get props => [items, index];
}
