import 'package:flutter/material.dart';
import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class RecipeCategoryText extends StatelessWidget {
  final Recipe recipe;
  const RecipeCategoryText({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          const Text(
            'Категория: ',
            style:
                TextStyle(fontSize: 20, color: AppColors.kTextLigntColor),
          ),
          DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.kPrimaryRedColor),),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '${recipe.category}',
                  style: const TextStyle(color: AppColors.kPrimaryRedColor),
                ),
              ),),),
        ],
      ),
    );
  }
}
