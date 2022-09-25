import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/recipe_bundle.dart';
import 'categories.dart';
import '../../../widgets/recipe_bundle_card.dart';
import 'package:sizer/sizer.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h), 
              child: GridView.builder(
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: MediaQuery.of(context).orientation == Orientation.landscape ? 2.w: 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) =>  RecipeBundleCard(
                  recipeBundle: recipeBundles[index],
                  press: (){},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
