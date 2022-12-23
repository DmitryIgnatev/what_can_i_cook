import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/photo_and_title.dart';

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
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '1. Сельдерей порезать на небольшие кусочки, луковицы на четвертинки, корень кориандра и корень имбиря порезать очень мелко. Положите все ингредиенты в большую кастрюлю, дайте закипеть, подержите на большом огне несколько минут, уменьшите огонь и снимите пенку с бульона. Накройте крышкой и дайте жидкости побулькать примерно час. 2. Процедите в случае необходимости несколько раз через мелкое ситечко, чтобы получить как можно более чистый бульон. Охладите и еще раз снимите пенку с поверхности. Бульон можно хранить в холодильнике несколько дней или заморозить для более долгого хранения. Подавайте бульон с вареными яйцами, лапшой и вареными креветками.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.kTextLigntColor,
                    fontFamily: 'museosanscyrl',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
