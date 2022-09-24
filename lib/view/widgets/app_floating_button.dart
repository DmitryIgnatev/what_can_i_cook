import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';

Widget appFloatingButton(BuildContext context, String title){
  return FloatingActionButton.extended(
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.add_box_sharp,
          color: kPrimaryRedColor,
        ),
        label:
         Text(
          title,
          style: const TextStyle(color: kPrimaryRedColor),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, '/new_recipe', (route) => false);
        });
}