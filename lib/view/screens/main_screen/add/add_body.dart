import 'package:flutter/material.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/item_cards.dart';

class AddBody extends StatefulWidget {
  const AddBody({super.key});

  @override
  State<AddBody> createState() => _AddBodyState();
}

class _AddBodyState extends State<AddBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemCards(),
        ],
      ),
    );
  }
}
