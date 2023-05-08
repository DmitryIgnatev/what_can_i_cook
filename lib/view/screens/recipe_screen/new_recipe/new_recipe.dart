import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/new_recipe/new_recipe_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhitethemecolor,
      extendBodyBehindAppBar: true,
      body: NewRecipeBody(),
      appBar: transparentAppBar(context),
    );
  }
}
