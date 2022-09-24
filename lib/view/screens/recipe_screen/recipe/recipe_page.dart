import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/recipe/recipe_body.dart';
import 'package:what_can_i_cook/services/firebase/init_firebase.dart';

class RecipePage extends StatefulWidget {
  final int pageIndex;
  const RecipePage(int i, {Key? key, required this.pageIndex})
      : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final InitFirebase initialise = InitFirebase();
  @override
  void initState() {
    super.initState();

    initialise.initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kWhitethemecolor,
      body: RecipeBody(pageIndex:widget.pageIndex),
    );
  }
}
