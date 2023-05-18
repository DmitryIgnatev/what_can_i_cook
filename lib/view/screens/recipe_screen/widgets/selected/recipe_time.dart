import 'package:flutter/material.dart';

import '../../../../../models/recipe.dart';
import '../../../../../utils/constants.dart';

class RecipeTime extends StatelessWidget {
  final Recipe recipe;
  const RecipeTime({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Время приготовления: ${recipe.time} минут",
      style: const TextStyle(color: AppColors.kTextLigntColor),
    );
  }
}
