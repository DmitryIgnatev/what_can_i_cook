import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'find_by_name_card.dart';

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
        child: const SingleChildScrollView(
          child: FindByNameCard(),
        )
      )
          );
  }
}