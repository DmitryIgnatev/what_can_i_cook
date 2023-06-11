import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import '../../../../../models/recipe.dart';

class RecipeCategoryText extends StatelessWidget {
  final Recipe recipe;
  const RecipeCategoryText({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Text(
            "Категория: ",
            style:
                const TextStyle(fontSize: 20, color: AppColors.kTextLigntColor),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.kPrimaryRedColor)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${recipe.category}",
                  style: TextStyle(color: AppColors.kPrimaryRedColor),
                ),
              ))),
        ],
      ),
    );
  }
}
