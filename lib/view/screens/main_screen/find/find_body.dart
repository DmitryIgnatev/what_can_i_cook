import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/view/widgets/find_ingredients_module.dart';
import '../../../../blocs/filtered_items/bloc/filtered_items_bloc.dart';
import '../../../../models/recipe.dart';
import '../../../../services/firebase/firestore.dart';
import '../../../../services/storage_service/future_picture.dart';
import '../../../../utils/constants.dart';

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
        )
      ],
      child: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  FindIngreidentsModule(onItemTap: () {}),
                  Expanded(
                      child: StreamBuilder<List<Recipe>>(
                    stream: ReadStore().readRecipes(),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: const Text('Нет записей'));
                      else {
                        final recipes = snapshot.data!;
                        return ListView.builder(
                          itemCount: recipes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.kPrimaryRedColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14),
                                        bottomLeft: Radius.circular(14),
                                      ),
                                      child: SizedBox(
                                        width: 30.w,
                                        child: FuturePicture(
                                          fileName: recipes[index].pictureUrl,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(recipes[index].name),
                                        Text("${recipes[index].ingredients}"),
                                        Text("${recipes[index].time}")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ))
                ],
              ))),
    );
  }
}
