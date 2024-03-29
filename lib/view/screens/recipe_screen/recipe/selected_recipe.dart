import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_category_list.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_description.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/delete_recipe_button.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_name.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_tag_list.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_description.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_ingredints.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_name.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_time.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';

import '../../../../blocs/filtered_items/bloc/filtered_items_bloc.dart';
import '../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../../models/recipe.dart';
import '../../../../services/storage_service/future_picture.dart';
import '../../../widgets/find_ingredients_module.dart';
import '../widgets/new/new_recipe_time.dart';
import '../widgets/selected/recipe_category_text.dart';
import '../widgets/selected/recipe_tag_list.dart';

class SelectedRecipe extends StatefulWidget {
  final int pageIndex;
  const SelectedRecipe({super.key, required this.pageIndex});

  @override
  State<SelectedRecipe> createState() => _SelectedRecipeState();
}

class _SelectedRecipeState extends State<SelectedRecipe> {
  bool isEdited = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.kWhitethemecolor,
      appBar: transparentAppBar(context),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<RecipeBloc>(
            create: (context) => RecipeBloc(),
          ),
          BlocProvider<FilteredItemsBloc>(
            create: (context) => FilteredItemsBloc(),
          )
        ],
        child: BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
          return SingleChildScrollView(
            child: StreamBuilder<List<Recipe>>(
                stream: ReadStore().readData('recipes', Recipe.fromJson),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final recipe = snapshot.data![widget.pageIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 0.40 * height,
                          child: Stack(children: <Widget>[
                            SizedBox(
                                width: height,
                                height: 0.40 * height - 30,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                    ),
                                    child: SizedBox(
                                      child: FuturePicture(
                                          pictureUrl: recipe.pictureUrl),
                                    ))),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 100,
                                  width: 0.95 * width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: isEdited
                                            ? <Widget>[
                                                NewRecipeName(),
                                              ]
                                            : <Widget>[
                                                RecipeName(recipe: recipe),
                                              ],
                                      )),
                                      //*edit button
                                      isEdited
                                          ? Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isEdited = false;
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    size: 28,
                                                    color: AppColors
                                                        .kPrimaryRedColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isEdited = false;
                                                    });
                                                    FireStore().updateRecipe(
                                                      recipe,
                                                      state.name,
                                                      state.ingredients,
                                                      state.hours * 60 +
                                                          state.minutes,
                                                      state.pictureUrl,
                                                      state.description,
                                                      state.tags,
                                                      state.category,
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.check,
                                                    size: 28,
                                                    color: AppColors
                                                        .kPrimaryRedColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            )
                                          : Container(
                                              height: 64,
                                              width: 64,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .kPrimaryRedColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isEdited = true;
                                                    });
                                                    context
                                                        .read<RecipeBloc>()
                                                        .add(RecipeCopyEvent(
                                                            name: recipe.name,
                                                            ingredients: recipe
                                                                .ingredients,
                                                            hours:
                                                                recipe.time ~/
                                                                    60,
                                                            minutes:
                                                                recipe.time %
                                                                    60,
                                                            description: recipe
                                                                .description,
                                                            pictureUrl: recipe
                                                                .pictureUrl,
                                                            tags: recipe.tags,
                                                            category: recipe
                                                                .category));
                                                  },
                                                  child: const Icon(
                                                    Icons.edit,
                                                    size: 28,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                      //*edit button end
                                      const SizedBox(width: 5)
                                    ],
                                  ),
                                ))
                          ]),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: isEdited
                              ? [
                                  NewCategoryList(),
                                  NewTagList(),
                                  NewRecipeTime(),
                                  FindIngreidentsModule(
                                    isAddButtonEnabled: true,
                                  ),
                                  NewRecipeDescription(),
                                  DeleteRecipeButton(recipe: recipe)
                                ]
                              : [
                                  RecipeCategoryText(recipe: recipe),
                                  RecipeTagList(recipe: recipe),
                                  RecipeTime(recipe: recipe),
                                  RecipeIngredients(recipe: recipe),
                                  RecipeDescription(recipe: recipe),
                                ],
                        )
                      ],
                    );
                  } else {
                    return const Text('Error');
                  }
                }),
          );
        }),
      ),
    );
  }
}
