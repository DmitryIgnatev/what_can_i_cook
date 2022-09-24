import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/find/find_body.dart';

class FindPage extends StatelessWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhitethemecolor,
      body:FindBody(),
    );
  }
}