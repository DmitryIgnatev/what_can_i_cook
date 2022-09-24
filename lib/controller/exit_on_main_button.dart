import 'package:flutter/material.dart';

Widget exitOnMainButton(BuildContext context) {
  return IconButton(
              onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
              icon: const Icon(Icons.close));
}
