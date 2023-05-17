import 'package:flutter/material.dart';

import '../../../../models/recipe.dart';
import '../../../../utils/constants.dart';

class RecipeIngredients extends StatelessWidget {
  final Recipe recipe;
  const RecipeIngredients({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ингредиенты:",
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
                  style:
                      TextStyle(fontSize: 18, color: AppColors.kTextLigntColor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
