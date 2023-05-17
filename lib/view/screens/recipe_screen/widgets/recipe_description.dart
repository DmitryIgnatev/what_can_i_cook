import 'package:flutter/material.dart';

import '../../../../models/recipe.dart';
import '../../../../utils/constants.dart';

class RecipeDescription extends StatelessWidget {
  final Recipe recipe;
  const RecipeDescription({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "${recipe.description}",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.kTextLigntColor,
          fontFamily: 'museosanscyrl',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
