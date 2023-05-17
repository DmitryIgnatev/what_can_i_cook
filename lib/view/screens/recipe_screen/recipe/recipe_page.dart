import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/recipe_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class RecipePage extends StatelessWidget {
  final int pageIndex;
  const RecipePage({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.kWhitethemecolor,
      body: RecipeBody(pageIndex: pageIndex),
      appBar: transparentAppBar(context),
    );
  }
}
