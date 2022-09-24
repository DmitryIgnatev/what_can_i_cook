import 'package:flutter/material.dart';

PreferredSizeWidget transparentAppbar(BuildContext context, List<Widget>? widgetActions) {
  return AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
        actions: widgetActions
      );
}

