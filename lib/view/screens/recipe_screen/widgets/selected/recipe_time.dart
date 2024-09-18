import 'package:flutter/material.dart';

import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class RecipeTime extends StatelessWidget {
  final Recipe recipe;
  const RecipeTime({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          const Text(
            'Время на приготовление: ',
            style: TextStyle(fontSize: 20, color: AppColors.kTextLigntColor),
          ),
          Text(
            '${recipe.time ~/ 60} ч ${recipe.time % 60} минут',
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.kPrimaryRedColor,
            ),
          ),
        ],
      ),
    );
  }
}
