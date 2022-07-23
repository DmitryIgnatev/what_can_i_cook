import 'package:flutter/material.dart';
import 'package:what_can_i_cook/constants.dart';
import 'package:what_can_i_cook/screens/main/recipe/recipe_body.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //foregroundColor: const Color.fromARGB(251, 241, 1, 73),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
              icon: const Icon(Icons.close))
        ],
      ),
      backgroundColor: kWhitethemecolor,
      body: const RecipeBody(),
    );
  }
}