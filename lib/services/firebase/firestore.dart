import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:what_can_i_cook/models/ingredient.dart';

import '../../models/recipe.dart';

class FireStore {
  void createRecipe(String name, List<String> ingredients, int minutes,
      String fileName, String description, List<String> tags, String category) async {
    final recipeDoc = FirebaseFirestore.instance.collection('recipes').doc();
    final Recipe recipeModel = Recipe(
        id: recipeDoc.id,
        name: name,
        ingredients: ingredients,
        time: minutes,
        pictureUrl: fileName,
        description: description,
        tags: tags,
        category: category
        );

    final json = recipeModel.toJson();
    await recipeDoc.set(json);
  }

  void deleteRecipe(Recipe recipe) async {
    FirebaseFirestore.instance.collection('recipes').doc(recipe.id).delete();
  }

  void updateRecipe(Recipe recipe, String name, List<String> ingredients,
      int minutes, String fileName, String description, 
      List<String> tags, String category
      ) async {
    final recipeDoc =
        FirebaseFirestore.instance.collection('recipes').doc(recipe.id);
    final Recipe recipeModel = Recipe(
        id: recipeDoc.id,
        name: name,
        ingredients: ingredients,
        time: minutes,
        pictureUrl: fileName,
        description: description,
        tags: tags, category: category
        );

    final json = recipeModel.toJson();
    await recipeDoc.update(json);
  }

  void createIngredient(String ingredient) async {
    final ingredientDoc =
        FirebaseFirestore.instance.collection('ingredients').doc();
    final Ingredient ingredientModel = Ingredient(
      id: ingredientDoc.id,
      name: ingredient,
    );

    final json = ingredientModel.toJson();
    await ingredientDoc.set(json);
  }
}

class ReadStore {
  Stream<List<T>> readData<T>(
      String collection, T Function(Map<String, dynamic>) fromJson) {
    return FirebaseFirestore.instance.collection(collection).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => fromJson(doc.data())).toList());
  }
}
