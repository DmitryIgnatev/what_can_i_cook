import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/blocs/filtered_items/bloc/filtered_items_bloc.dart';
import 'package:what_can_i_cook/blocs/recipe/bloc/recipe_bloc.dart';
import 'package:what_can_i_cook/models/recipe.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/selected_recipe.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_category_list.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_tag_list.dart';
import 'package:what_can_i_cook/view/widgets/find_ingredients_module.dart';

class FindBody extends StatefulWidget {
  const FindBody({super.key});

  @override
  State<FindBody> createState() => _FindBodyState();
}

class _FindBodyState extends State<FindBody> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilteredItemsBloc>(
          create: (context) => FilteredItemsBloc(),
        ),
        BlocProvider<RecipeBloc>(
          create: (context) => RecipeBloc(),
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const NewCategoryList(),
                  const NewTagList(),
                  const FindIngreidentsModule(),
                  BlocBuilder<RecipeBloc, RecipeState>(
                    builder: (context, state) {
                      return StreamBuilder<List<Recipe>>(
                        stream:
                            ReadStore().readData('recipes', Recipe.fromJson),
                        builder: (BuildContext context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: Text('Нет записей'));
                          } else {
                            final List<Recipe> recipes = snapshot.data!
                                .where(
                                  (thisRecipe) =>
                                      thisRecipe.ingredients.any(
                                        (element) =>
                                            state.ingredients.contains(element),
                                      ) &&
                                      thisRecipe.category == state.category,
                                )
                                .toList();
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: recipes.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SelectedRecipe(
                                            pageIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      height: 90,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(14),
                                            ),
                                            child: SizedBox(
                                              width: 0.30 * width,
                                              child: FuturePicture(
                                                pictureUrl:
                                                    recipes[index].pictureUrl,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              5,
                                              2,
                                              0,
                                              0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  recipes[index].name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 0.5 * width,
                                                  child: Text(
                                                    recipes[index]
                                                        .ingredients
                                                        .toString()
                                                        .replaceAll('[', '')
                                                        .replaceAll(']', ''),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Время на приготовление: ${recipes[index].time ~/ 60} ч ${recipes[index].time % 60} минут',
                                                ),
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
