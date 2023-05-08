import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/recipe_body.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';

class RecipePage extends StatefulWidget {
  final int pageIndex;
  const RecipePage(int i, {Key? key, required this.pageIndex})
      : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.kWhitethemecolor,
      body: RecipeBody(pageIndex:widget.pageIndex),
      appBar: transparentAppBar(context),
    );
  }
}
