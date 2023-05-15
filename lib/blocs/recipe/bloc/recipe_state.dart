part of 'recipe_bloc.dart';

class RecipeState extends Equatable {
  final String name;
  final List<String> ingredients;
  final int minutes;
  final String description;
  final String pictureUrl;

  const RecipeState(
      {required this.name,
      required this.ingredients,
      required this.minutes,
      required this.description,
      required this.pictureUrl});

  factory RecipeState.initial() => RecipeState(
      name: "",
      ingredients: [],
      minutes: 0,
      description: "",
      pictureUrl: "DefaultPicture.jpg");

  RecipeState copyWith({
    String? name,
    List<String>? ingredients,
    int? minutes,
    String? description,
    String? pictireUrl,
  }) {
    return RecipeState(
        name: name ?? this.name,
        ingredients: ingredients ?? this.ingredients,
        minutes: minutes ?? this.minutes,
        description: description ?? this.description,
        pictureUrl: pictireUrl ?? this.pictureUrl);
  }

  @override
  List<Object> get props =>
      [name, ingredients, minutes, description, pictureUrl];
}