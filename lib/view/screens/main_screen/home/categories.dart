import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/view/widgets/horisontally_scroll_items.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Хочу посмотреть все рецепты",
    "Быстрые рецепты",
    "Простые рецепты",
    "Популярные рецепты"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: ((context, index) => horisontallyScrollableItems(
                  index,
                  categories,
                  selectedIndex,
                  () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ))),
      ),
    );
  }
}