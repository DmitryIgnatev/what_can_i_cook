import 'package:flutter/material.dart';

import 'package:what_can_i_cook/models/recipe.dart';

class RecipeName extends StatelessWidget {
  final Recipe recipe;
  const RecipeName({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Text(
        recipe.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
