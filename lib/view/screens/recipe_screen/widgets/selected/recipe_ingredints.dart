import 'package:flutter/material.dart';

import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class RecipeIngredients extends StatelessWidget {
  final Recipe recipe;
  const RecipeIngredients({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ингредиенты:',
            textAlign: TextAlign.start,
            style: TextStyle(
              //fontWeight: FontWeight.w500,
              color: AppColors.kTextColor,
              fontSize: 24,
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  recipe.ingredients[index],
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.kTextLigntColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
