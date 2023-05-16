part of 'filtered_items_bloc.dart';

class FilteredItemsState extends Equatable {
  final List<Ingredient> items;
  final Ingredient ingredient;
  const FilteredItemsState({required this.items, required this.ingredient});

  factory FilteredItemsState.initial() => FilteredItemsState(
      items: [], ingredient: Ingredient(id: "", ingredient: ""));

  FilteredItemsState copyWith(
      {List<Ingredient>? items, Ingredient? ingredient}) {
    return FilteredItemsState(
        items: items ?? this.items, ingredient: ingredient ?? this.ingredient);
  }

  @override
  List<Object> get props => [items, ingredient];
}
