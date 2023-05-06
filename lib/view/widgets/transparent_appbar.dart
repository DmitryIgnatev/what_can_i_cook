import 'package:flutter/material.dart';

import '../screens/main_screen/main_screen.dart';

PreferredSizeWidget transparentAppBar(BuildContext context) {
  return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MainScreen(),
                ),
              );
            },
            icon: const Icon(Icons.close))
      ]);
}
