import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:sizer/sizer.dart';
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
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: StreamBuilder<List<Recipe>>(
                stream: ReadStore().readRecipes(),
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
                          crossAxisSpacing: 1.w,
                          mainAxisSpacing: 1.h,
                          childAspectRatio:
                              0.6 //?длина карточки, но есть проблемы с версткой экрана !
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.h),
                            ),
                            child: Column(
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
                                      height: 20.h,
                                      width: 48.w,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.h),
                                          topRight: Radius.circular(3.h),
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
                                            fontSize: 3.h,
                                            color: AppColors.kPrimaryRedColor),
                                      ),
                                      Text(
                                        "${recipes[index].ingredients.toString().replaceAll('[', '').replaceAll(']', '')}",
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 2.h,
                                            color: AppColors.kTextColor),
                                      ),
                                      Text(
                                        "Время на приготовление:\n${recipes[index].time ~/ 60} ч ${recipes[index].time % 60} минут",
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 2.h,
                                            color: AppColors.kTextColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]);
                      },
                    );
                  }
                })));
  }
}
