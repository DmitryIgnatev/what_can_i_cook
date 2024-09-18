import 'package:flutter/material.dart';
import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/utils/constants.dart';

class RecipeTagList extends StatelessWidget {
  final Recipe recipe;
  const RecipeTagList({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          const Text(
            'Тэги:',
            style:
                TextStyle(fontSize: 20, color: AppColors.kTextLigntColor),
          ),
          Expanded(
            child: SizedBox(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipe.tags.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: AppColors.kPrimaryRedColor,),),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '${recipe.tags[index]}',
                              style:
                                  const TextStyle(color: AppColors.kPrimaryRedColor),
                            ),
                          ),),),
                    );
                  },),
            ),
          ),
        ],
      ),
    );
  }
}
