import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/recipe_bundle.dart';
import 'package:sizer/sizer.dart';

class RecipeBundleCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipeBundleCard(
      {super.key, required this.recipeBundle, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Container(
        decoration: BoxDecoration(
            color: recipeBundle.color,
            borderRadius: BorderRadius.circular(3.h)),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    recipeBundle.title,
                    style: TextStyle(fontSize: 3.h, color: Colors.white),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    recipeBundle.description,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                ],
              ),
            )),
            AspectRatio(
                aspectRatio: 0.71,
                child:
                    Image.asset(recipeBundle.imageSrc, fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
