import 'package:flutter/material.dart';

class FindBody extends StatefulWidget {
  const FindBody({Key? key}) : super(key: key);

  @override
  State<FindBody> createState() => _FindBodyState();
}

class _FindBodyState extends State<FindBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Text("Поиск рецептов по уже имеющимся у вас ингридиентам"));
  }
}