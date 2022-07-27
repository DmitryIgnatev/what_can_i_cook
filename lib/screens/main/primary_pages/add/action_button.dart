import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';



class ActionButton extends StatelessWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.add_box_sharp,
          color: kPrimaryColor,
        ),
        label: const Text(
          'Добавить собственный рецепт ',
          style: TextStyle(color: kPrimaryColor),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, '/new_recipe', (route) => false);
        });
  }
}
