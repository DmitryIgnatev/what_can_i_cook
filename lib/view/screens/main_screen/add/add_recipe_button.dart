import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/new_recipe/new_recipe.dart';

class AddRecipeButton extends StatelessWidget {
  const AddRecipeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.add_box_sharp,
          color: AppColors.kPrimaryRedColor,
        ),
        label: const Text(
          'Добавить собственный рецепт',
          style: TextStyle(color: AppColors.kPrimaryRedColor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewRecipe()),
          );
        });
  }
}
