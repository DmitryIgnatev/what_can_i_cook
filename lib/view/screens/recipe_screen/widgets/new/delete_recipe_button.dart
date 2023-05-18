import 'package:flutter/material.dart';

import '../../../../../models/recipe.dart';
import '../../../../../services/firebase/firestore.dart';
import '../../../../../utils/constants.dart';

class DeleteRecipeButton extends StatelessWidget {
  final Recipe recipe;
  const DeleteRecipeButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: GestureDetector(
          onTap: () {
            FireStore().deleteRecipe(recipe);
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.kPrimaryRedColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Удалить рецепт",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
