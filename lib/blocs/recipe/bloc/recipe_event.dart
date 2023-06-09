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

class RecipeMinutesEvent extends RecipeEvent {
  final int minutes;

  const RecipeMinutesEvent({required this.minutes});
}

class RecipeHoursEvent extends RecipeEvent {
  final int hours;

  const RecipeHoursEvent({required this.hours});
}

class RecipeDescriptionEvent extends RecipeEvent {
  final String description;

  const RecipeDescriptionEvent({required this.description});
}

class RecipePicUrlEvent extends RecipeEvent {
  final String pictureUrl;

  const RecipePicUrlEvent({required this.pictureUrl});
}

class RecipeCopyEvent extends RecipeEvent {
  final String name;
  final List<String> ingredients;
  final int minutes;
  final int hours;
  final String description;
  final String pictureUrl;

  const RecipeCopyEvent(
      {required this.name,
      required this.ingredients,
      required this.minutes,
      required this.hours,
      required this.description,
      required this.pictureUrl});
}
