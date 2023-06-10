import 'package:flutter/material.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_description.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_name.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/widgets/new/new_recipe_time.dart';
import 'package:what_can_i_cook/view/widgets/transparent_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/blocs/filtered_items/bloc/filtered_items_bloc.dart';
import 'package:what_can_i_cook/services/firebase/firestore.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/services/storage_service/storage_service.dart';

import '../../../../blocs/recipe/bloc/recipe_bloc.dart';
import '../../../widgets/find_ingredients_module.dart';
import '../widgets/new/tag_list.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  height: 40.h,
                  child: Stack(children: <Widget>[
                    SizedBox(
                        width: 100.h,
                        height: 40.h - 30,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.h),
                            ),
                            child:
                                FuturePicture(pictureUrl: state.pictureUrl))),
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
                            color: Colors.white,
                          ),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  NewRecipeName(),
                                ],
                              )),
                              //*edit button
                              SizedBox(
                                height: 64,
                                width: 64,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      context.read<RecipeBloc>().add(
                                          RecipePicUrlEvent(
                                              pictureUrl: await StorageService()
                                                  .pickPictire(context)));
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: AppColors
                                                      .kPrimaryRedColor))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.kPrimaryRedColor),
                                    ),
                                    child: const Icon(
                                      Icons.photo_camera,
                                      size: 28,
                                      color: Colors.white,
                                    )),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                height: 64,
                                width: 64,
                                child: ElevatedButton(
                                    onPressed: () {
                                      FireStore().createRecipe(
                                          state.name,
                                          state.ingredients,
                                          state.hours * 60 + state.minutes,
                                          state.pictureUrl,
                                          state.description);
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: AppColors
                                                      .kPrimaryRedColor))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.kPrimaryRedColor),
                                    ),
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
                TagList(),
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
