import 'package:flutter/material.dart';

Widget myTile(
  BuildContext context,
  IconData icon,
  String title,
  VoidCallback voidCallback,
) {
  return Column(
    children: [
      ListTile(
        tileColor: Colors.black.withOpacity(.08),
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        onTap: voidCallback,
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        trailing: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 5,
        width: MediaQuery.of(context).size.width,
      )
    ],
  );
}
