import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/blocs/recipe/bloc/recipe_bloc.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_category_list.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_tag_list.dart';
import 'package:what_can_i_cook/view/widgets/find_ingredients_module.dart';
import '../../../../blocs/filtered_items/bloc/filtered_items_bloc.dart';
import '../../../../models/recipe.dart';
import '../../../../services/firebase/firestore.dart';
import '../../../../services/storage_service/future_picture.dart';
import '../../recipe_screen/recipe/selected_recipe.dart';

class FindBody extends StatefulWidget {
  const FindBody({Key? key}) : super(key: key);

  @override
  State<FindBody> createState() => _FindBodyState();
}

class _FindBodyState extends State<FindBody> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilteredItemsBloc>(
          create: (context) => FilteredItemsBloc(),
        ),
        BlocProvider<RecipeBloc>(
          create: (context) => RecipeBloc(),
        )
      ],
      child: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  NewCategoryList(),
                  NewTagList(),
                  FindIngreidentsModule(),
                  BlocBuilder<RecipeBloc, RecipeState>(
                      builder: (context, state) {
                    return Expanded(
                        child: StreamBuilder<List<Recipe>>(
                      stream: ReadStore().readData('recipes', Recipe.fromJson),
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: const Text('Нет записей'));
                        else {
                          List<Recipe> recipes = snapshot.data!
                              .where((thisRecipe) =>
                                      thisRecipe.ingredients.any((element) =>
                                          state.ingredients
                                              .contains(element)) &&
                                      thisRecipe.category == state.category
                                  //TODO добавить функционал, чтобы рецепты с тэгами были в приоритете
                                  )
                              .toList();

                          /*
                          List<Recipe> recipes = snapshot.data!
                              .where((list) =>
                                  list.ingredients.contains(state.ingredients))
                              .toList();
                              */
                          return ListView.builder(
                            itemCount: recipes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectedRecipe(
                                                pageIndex: index,
                                              )),
                                    );
                                  },
                                  child: SizedBox(
                                    height: 90,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                          child: SizedBox(
                                            width: 30.w,
                                            child: FuturePicture(
                                              pictureUrl:
                                                  recipes[index].pictureUrl,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 2, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                recipes[index].name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                  height: 30,
                                                  width: 50.w,
                                                  child: Text(
                                                      "${recipes[index].ingredients.toString().replaceAll('[', '').replaceAll(']', '')}")),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Время на приготовление: ${recipes[index].time ~/ 60} ч ${recipes[index].time % 60} минут",
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ));
                  })
                ],
              ))),
    );
  }
}
