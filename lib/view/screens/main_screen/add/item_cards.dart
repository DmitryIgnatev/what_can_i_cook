import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/selected_recipe.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';

import '../../../../models/recipe.dart';
import '../../../../services/firebase/firestore.dart';

class ItemCards extends StatefulWidget {
  const ItemCards({Key? key}) : super(key: key);

  @override
  State<ItemCards> createState() => _ItemCardsState();
}

class _ItemCardsState extends State<ItemCards> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.02 * width),
            child: StreamBuilder<List<Recipe>>(
                stream: ReadStore().readData('recipes', Recipe.fromJson),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text(
                        'Произошла ошибка',
                        style: TextStyle(
                          fontSize: 34,
                          color: AppColors.kTextLigntColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    final recipes = snapshot.data!;
                    if (recipes.length == 0) {
                      return const Center(
                        child: Text(
                          'Нет записей',
                          style: TextStyle(
                            fontSize: 34,
                            color: AppColors.kTextLigntColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      itemCount: recipes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 4
                              : 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              0.6 //?длина карточки, но есть проблемы с версткой экрана !
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectedRecipe(
                                                pageIndex: index,
                                              )),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 0.20 * height,
                                    width: 0.48 * width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: FuturePicture(
                                        pictureUrl: recipes[index].pictureUrl,
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipes[index].name,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.kPrimaryRedColor),
                                    ),
                                    Text(
                                      "${recipes[index].ingredients.toString().replaceAll('[', '').replaceAll(']', '')}",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.kTextColor),
                                    ),
                                    Text(
                                      "Время на приготовление:\n${recipes[index].time ~/ 60} ч ${recipes[index].time % 60} минут",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.kTextColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]);
                      },
                    );
                  }
                })));
  }
}
