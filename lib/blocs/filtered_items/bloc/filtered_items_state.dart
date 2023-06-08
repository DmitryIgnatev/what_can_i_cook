part of 'filtered_items_bloc.dart';

class FilteredItemsState extends Equatable {
  final List<Ingredient> items;
  const FilteredItemsState({required this.items});

  factory FilteredItemsState.initial() => FilteredItemsState(items: []);

  FilteredItemsState copyWith(
      {List<Ingredient>? items, Ingredient? ingredient}) {
    return FilteredItemsState(items: items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}
