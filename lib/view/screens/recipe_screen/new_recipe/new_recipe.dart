import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/new_recipe/new_recipe_body.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kWhitethemecolor,
      extendBodyBehindAppBar: true,
      body: NewRecipeBody(),
    );
  }
}
