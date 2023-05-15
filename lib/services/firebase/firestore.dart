import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_can_i_cook/models/ingredient.dart';

import '../../models/recipe.dart';
import '../../models/tag.dart';

class FireStore {
  void createRecipe(String name, List<String> ingridients, int minutes,
      String fileName, String description) async {
    final recipeDoc = FirebaseFirestore.instance.collection('recipes').doc();
    final Recipe recipe = Recipe(
        id: recipeDoc.id,
        name: name,
        ingredients: ingridients,
        time: minutes,
        pictureUrl: fileName,
        description: description);

    final json = recipe.toJson();
    await recipeDoc.set(json);
  }

  void deleteRecipe(Recipe recipe) async {
    FirebaseFirestore.instance.collection('recipes').doc(recipe.id).delete();
  }

  void createIngredient(
      String ingredient) async {
    final ingredientDoc =
        FirebaseFirestore.instance.collection('ingredients').doc();
    final Ingredient recipe = Ingredient(
      id: ingredientDoc.id,
      ingredient: ingredient,
    );

    final json = recipe.toJson();
    await ingredientDoc.set(json);
  }
}

class ReadStore {
  Stream<List<Recipe>> readRecipes() => FirebaseFirestore.instance
      .collection('recipes')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  Stream<List<Tag>> readTags() => FirebaseFirestore.instance
      .collection('tags')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Tag.fromJson(doc.data())).toList());

  Stream<List<Ingredient>> readIngredients() => FirebaseFirestore.instance
      .collection('ingredients')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Ingredient.fromJson(doc.data())).toList());
}
