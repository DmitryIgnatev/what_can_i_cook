import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/find/find_by_ingridients_card.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/find/find_by_name_card.dart';

class FindBody extends StatefulWidget {
  const FindBody({Key? key}) : super(key: key);

  @override
  State<FindBody> createState() => _FindBodyState();
}

class _FindBodyState extends State<FindBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
       padding: EdgeInsets.all(1.h),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2.h,
            childAspectRatio: 0.8,
            crossAxisSpacing: MediaQuery.of(context).orientation == Orientation.landscape ? 2.w: 0,
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 2 : 1,),
            children: const [
              FindByNameCard(),
              FindByIngridientCard(),
            ],
            ),
      )
          );
  }
}