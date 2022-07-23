import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/constants.dart';
import 'package:what_can_i_cook/screens/main/new_recipe/future_picture.dart';

class PhotoAndRating extends StatelessWidget {
  const PhotoAndRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 100.w,
      child: Stack(children: <Widget>[
        Container(
            width: 100.w,
            height: 40.h - 50,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.h),
                ),
                child: FuturePicture(fileName: 'DefaultPicture.jpg'))),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.h),
                    topLeft: Radius.circular(5.h)),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: kTextLigntColor,
                  )
                ],
                color: Colors.white,
              ),
            ))
      ]),
    );
  }
}