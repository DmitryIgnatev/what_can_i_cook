import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget bigInfoCard(BuildContext context, List<Widget> widgetElements) {
  return Container(
          width: 90.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 90,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widgetElements
          ),
        );
}