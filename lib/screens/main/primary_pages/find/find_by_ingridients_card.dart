import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';

class FindByIngridientCard extends StatefulWidget {
  const FindByIngridientCard({Key? key}) : super(key: key);

  @override
  State<FindByIngridientCard> createState() => _FindByIngridientCardState();
}

class _FindByIngridientCardState extends State<FindByIngridientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(3.h)
                ),
                //height: 60.h,
              );
  }
}