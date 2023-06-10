part of 'recipe_bloc.dart';

class RecipeState extends Equatable {
  final String name;
  final List<String> ingredients;
  final int hours;
  final int minutes;
  final String description;
  final String pictureUrl;
  final List<String> tags;
  final String category;

  const RecipeState(
      {required this.name,
      required this.ingredients,
      required this.hours,
      required this.minutes,
      required this.description,
      required this.pictureUrl,
      required this.tags,
      required this.category});

  factory RecipeState.initial() => RecipeState(
      name: "",
      ingredients: [],
      hours: 0,
      minutes: 0,
      description: "",
      pictureUrl: "DefaultPicture.jpg",
      tags: [],
      category: "");

  RecipeState copyWith(
      {String? name,
      List<String>? ingredients,
      int? hours,
      int? minutes,
      String? description,
      String? pictireUrl,
      List<String>? tags,
      String? category}) {
    return RecipeState(
        name: name ?? this.name,
        ingredients: ingredients ?? this.ingredients,
        hours: hours ?? this.hours,
        minutes: minutes ?? this.minutes,
        description: description ?? this.description,
        pictureUrl: pictireUrl ?? this.pictureUrl,
        tags: tags ?? this.tags,
        category: category ?? this.category);
  }

  @override
  List<Object> get props => [
        name,
        ingredients,
        hours,
        minutes,
        description,
        pictureUrl,
        tags,
        category
      ];
}
