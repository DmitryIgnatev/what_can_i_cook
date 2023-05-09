import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';
import 'package:what_can_i_cook/utils/constants.dart';

import '../../../../models/recipe.dart';
import '../../../../services/firebase/firestore.dart';

class FindByNameCard extends StatefulWidget {
  const FindByNameCard({Key? key}) : super(key: key);

  @override
  State<FindByNameCard> createState() => _FindByNameCardState();
}

class _FindByNameCardState extends State<FindByNameCard> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Recipe>>(
      //*WORKING WITH ELEMENTS in firebase
      stream: ReadStore().readRecipes(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData)
          return const Text('Нет записей');
        else {
          final recipes = snapshot.data!;
          return Column(
            children: <Widget>[
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.kPrimaryRedColor),
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
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
