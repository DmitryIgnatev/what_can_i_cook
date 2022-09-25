import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';

Widget horisontallyScrollableItems(
  int index,
  List<String> items,
  int selectedIndex,
  Function() widgetOnTap,
) {
  return GestureDetector(
    onTap: widgetOnTap,
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
            color: selectedIndex == index ? kPrimaryRedColor : kTextLigntColor),
      ),
    ),
  );
}
