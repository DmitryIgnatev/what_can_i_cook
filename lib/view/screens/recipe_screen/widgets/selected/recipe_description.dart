import 'package:flutter/material.dart';

import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class RecipeDescription extends StatelessWidget {
  final Recipe recipe;
  const RecipeDescription({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        '${recipe.description}',
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.kTextLigntColor,
          fontFamily: 'museosanscyrl',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
