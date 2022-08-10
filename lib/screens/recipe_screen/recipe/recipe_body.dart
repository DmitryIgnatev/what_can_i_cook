import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/screens/recipe_screen/recipe/photo_and_title.dart';

class RecipeBody extends StatelessWidget {
  final int pageIndex;
  const RecipeBody({Key? key, required this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
  slivers: <Widget>[
     SliverAppBar(
      //?leading button created automatically?
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: 40.h,
      flexibleSpace: FlexibleSpaceBar(
        background: PhotoAndTitle(pageIndex: pageIndex),
      ),
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.h,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            //color: kWhitethemecolor,
            child:
            const Text('*Информация о рецепе\nПредставим что она есть'),
          );
        },
        childCount: 1,
      ),
    ),
    
  ],
);
    
    /*
    StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('items').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return const Text('Нет записей');
            return Column(
              children: <Widget>[
                PhotoAndTitle(pageIndex: pageIndex),
                const Padding(
                  padding: EdgeInsets.all(kDefaultPaddin),

                )
              ],
            );
          });
          */
  }
}
