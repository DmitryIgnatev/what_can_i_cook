import 'package:flutter/material.dart';

import '../../../../../models/recipe.dart';

class RecipeName extends StatelessWidget {
  final Recipe recipe;
  const RecipeName({super.key, required this.recipe});

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
