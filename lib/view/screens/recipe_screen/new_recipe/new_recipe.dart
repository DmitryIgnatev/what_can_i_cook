import 'package:flutter/material.dart';
import 'package:what_can_i_cook/view/screens/recipe_screen/new_recipe/new_recipe_body.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(250, 255, 255, 255),
        foregroundColor: const Color.fromARGB(251, 241, 1, 73),
        title: const Text('Новый рецепт'),
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
      body: const NewRecipeBody(),
    );
  }
}