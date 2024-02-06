import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_category_list.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_description.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_name.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_time.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_can_i_cook/blocs/filtered_items/bloc/filtered_items_bloc.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';

import '../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../widgets/find_ingredients_module.dart';
import '../widgets/new/new_tag_list.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kWhitethemecolor,
      extendBodyBehindAppBar: true,
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
            child: Column(
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
                            child:
                                FuturePicture(pictureUrl: state.pictureUrl))),
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
                              Expanded(child: NewRecipeName()),
                              //*edit button
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    color: AppColors.kPrimaryRedColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: InkWell(
                                    onTap: () async {
                                      context.read<RecipeBloc>().add(
                                          RecipePicUrlEvent(
                                              pictureUrl: await StorageService()
                                                  .pickPictire(context)));
                                    },
                                    child: const Icon(
                                      Icons.photo_camera,
                                      size: 25,
                                      color: Colors.white,
                                    )),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    color: AppColors.kPrimaryRedColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: InkWell(
                                    onTap: () {
                                      FireStore().createRecipe(
                                          state.name,
                                          state.ingredients,
                                          state.hours * 60 + state.minutes,
                                          state.pictureUrl,
                                          state.description,
                                          state.tags,
                                          state.category);
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      size: 28,
                                      color: Colors.white,
                                    )),
                              ),
                              //*edit button end
                              const SizedBox(width: 5),
                            ],
                          ),
                        ))
                  ]),
                ),
                NewCategoryList(),
                NewTagList(),
                NewRecipeTime(),
                FindIngreidentsModule(
                  isAddButtonEnabled: true,
                ),
                NewRecipeDescription()
              ],
            ),
          );
        }),
      ),
    );
  }
}
