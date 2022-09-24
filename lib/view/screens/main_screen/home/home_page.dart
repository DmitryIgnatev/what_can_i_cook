import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/home/home_body.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context)  {
    return const Scaffold(
      backgroundColor: kWhitethemecolor,
      body: HomeBody(),
    );
  }
}