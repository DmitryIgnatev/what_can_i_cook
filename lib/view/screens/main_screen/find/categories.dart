import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.01 * height),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 0.01 * width),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.05 * width,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: selectedIndex == index
                                ? AppColors.kPrimaryRedColor
                                : AppColors.kTextLigntColor),
                        color: selectedIndex == index
                            ? const Color.fromARGB(255, 235, 235, 235)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index
                              ? AppColors.kPrimaryRedColor
                              : AppColors.kTextLigntColor),
                    ),
                  ),
                ))),
      ),
    );
  }
}
