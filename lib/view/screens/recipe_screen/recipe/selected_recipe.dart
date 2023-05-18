import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_description.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/delete_recipe_button.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_name.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_description.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_ingredints.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_name.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/selected/recipe_time.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';

import '../../../../blocs/filtered_items/bloc/filtered_items_bloc.dart';
import '../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../../models/recipe.dart';
import '../../../../services/storage_service/future_picture.dart';
import '../../../widgets/find_ingredients_module.dart';
import '../widgets/new/new_recipe_time.dart';

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
                stream: ReadStore().readRecipes(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final recipe = snapshot.data![widget.pageIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: Stack(children: <Widget>[
                            SizedBox(
                                width: 100.h,
                                height: 40.h - 30,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.h),
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
                                  width: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 95.h
                                      : 95.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.h),
                                        topLeft: Radius.circular(5.h)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 5,
                                        color: AppColors.kTextLigntColor,
                                      )
                                    ],
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
                                                NewRecipeTime()
                                              ]
                                            : <Widget>[
                                                RecipeName(recipe: recipe),
                                                RecipeTime(recipe: recipe)
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
                                                        state.minutes,
                                                        state.pictureUrl,
                                                        state.description);
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
                                          : SizedBox(
                                              height: 64,
                                              width: 64,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isEdited = true;
                                                    });
                                                    context
                                                        .read<RecipeBloc>()
                                                        .add(RecipeCopyEvent(
                                                            name: recipe.name,
                                                            ingredients: recipe
                                                                .ingredients,
                                                            minutes:
                                                                recipe.time,
                                                            description: recipe
                                                                .description,
                                                            pictureUrl: recipe
                                                                .pictureUrl));
                                                  },
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: const BorderSide(
                                                                color: AppColors
                                                                    .kPrimaryRedColor))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .kPrimaryRedColor),
                                                  ),
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
                                  FindIngreidentsModule(
                                    isAddButtonEnabled: true,
                                  ),
                                  NewRecipeDescription(),
                                  DeleteRecipeButton(recipe: recipe)
                                ]
                              : [
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
