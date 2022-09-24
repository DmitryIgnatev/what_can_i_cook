import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/view/widgets/photo_and_title.dart';

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
          flexibleSpace: FlexibleSpaceBar(background: photoAndTitle(pageIndex)),
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
                child:
                    const Text('*Информация о рецепе\nПредставим что она есть'),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
