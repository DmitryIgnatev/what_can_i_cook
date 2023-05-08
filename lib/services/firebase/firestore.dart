import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/recipe.dart';
import '../../models/tag.dart';

class FireStore {
  void createRecipe(
      String name, String ingridients, int minutes, String fileName) async {
    final recipeDoc = FirebaseFirestore.instance.collection('recipes').doc();
    final Recipe recipe = Recipe(
        id: recipeDoc.id,
        name: name,
        ingridients: ingridients,
        time: minutes,
        pictureUrl: fileName);

    final json = recipe.toJson();
    await recipeDoc.set(json);
  }

  void deleteRecipe(Recipe recipe) async {
    FirebaseFirestore.instance.collection('recipes').doc(recipe.id).delete();
  }
}

class ReadStore extends FireStore {
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
}
