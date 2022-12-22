import 'package:flutter/material.dart';
import 'package:what_can_i_cook/view/screens/main_screen/main_screen.dart';

Widget exitOnMainButton(BuildContext context) {
  return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const MainScreen(),
          ),
        );
      },
      icon: const Icon(Icons.close));
}
