import 'package:flutter/material.dart';

import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class DeleteRecipeButton extends StatelessWidget {
  final Recipe recipe;
  const DeleteRecipeButton({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            FireStore().deleteRecipe(recipe);
          },
          child: const DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.kPrimaryRedColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Удалить рецепт',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
