import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';

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
            itemBuilder: ((context, index) =>
                horisontallyScrollableItems(index, categories))),
      ),
    );
  }

  Widget horisontallyScrollableItems(int index, List<String> items) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 1.w),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryRedColor),
            color: selectedIndex == index
                ? const Color.fromARGB(255, 235, 235, 235)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5.w)),
        child: Text(
          items[index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  selectedIndex == index ? kPrimaryRedColor : kTextLigntColor),
        ),
      ),
    );
  }
}
