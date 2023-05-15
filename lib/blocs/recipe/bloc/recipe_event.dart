part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class RecipeNameEvent extends RecipeEvent {
  final String name;

  const RecipeNameEvent({required this.name});
}

class RecipeAddIngredientsEvent extends RecipeEvent {
  final String ingredient;

  const RecipeAddIngredientsEvent({required this.ingredient});
  @override
  List<Object> get props => [ingredient];
}

class RecipeDeleteIngredientsEvent extends RecipeEvent {
  final String ingredient;

  const RecipeDeleteIngredientsEvent({required this.ingredient});

  @override
  List<Object> get props => [ingredient];
}

class RecipeTimeEvent extends RecipeEvent {
  final int minutes;

  const RecipeTimeEvent({required this.minutes});
}

class RecipeDescriptionEvent extends RecipeEvent {
  final String description;

  const RecipeDescriptionEvent({required this.description});
}

class RecipePicUrlEvent extends RecipeEvent {
  final String pictureUrl;

  const RecipePicUrlEvent({required this.pictureUrl});
}
