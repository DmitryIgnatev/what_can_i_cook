import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/utils/constants.dart';
import 'package:what_can_i_cook/services/storage_service/future_picture.dart';

Widget photoAndTitle(int pageIndex) {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Error');
        return SizedBox(
          height: 40.h,
          child: Stack(children: <Widget>[
            SizedBox(
                width: 100.h,
                height: 40.h-30,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.h),
                    ),
                    child: FuturePicture(
                        fileName: (snapshot.data!)
                            .docs[pageIndex]
                            .get('pictureUrl')))),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 95.h
                      : 95.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.h),
                        topLeft: Radius.circular(5.h)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: AppColors.kTextLigntColor,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (snapshot.data!).docs[pageIndex].get('name'),
                            //'Название рецепта',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Время приготовления: ${(snapshot.data!).docs[pageIndex].get('time')} минут",
                            style: const TextStyle(
                                color: AppColors.kTextLigntColor),
                          )
                        ],
                      )),
                      //*edit button
                      SizedBox(
                        height: 64,
                        width: 64,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: AppColors.kPrimaryRedColor))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.kPrimaryRedColor),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 28,
                              color: Colors.white,
                            )),
                      ),
                      //*edit button end
                      const SizedBox(width: 5)
                    ],
                  ),
                ))
          ]),
        );
      });
}
