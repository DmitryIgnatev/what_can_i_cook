import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/new_recipe/new_recipe.dart';

Widget appFloatingButton(BuildContext context, String title) {
  return FloatingActionButton.extended(
      backgroundColor: Colors.white,
      icon: const Icon(
        Icons.add_box_sharp,
        color: kPrimaryRedColor,
      ),
      label: Text(
        title,
        style: const TextStyle(color: kPrimaryRedColor),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewRecipe()),
        );
      });
}
