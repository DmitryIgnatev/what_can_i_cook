import 'package:flutter/material.dart';

import '../../../../../models/recipe.dart';
import '../../../../../utils/constants.dart';

class RecipeTime extends StatelessWidget {
  final Recipe recipe;
  const RecipeTime({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Text(
            "Время на приготовление: ",
            style:
                const TextStyle(fontSize: 20, color: AppColors.kTextLigntColor),
          ),
          Text(
            "${recipe.time ~/ 60} ч ${recipe.time % 60} минут",
            style: const TextStyle(
                fontSize: 20, color: AppColors.kPrimaryRedColor),
          ),
        ],
      ),
    );
  }
}
