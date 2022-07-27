import 'package:flutter/material.dart';
import 'package:what_can_i_cook/screens/main/primary_pages/add/item_card.dart';


class AddBody extends StatefulWidget {
  const AddBody({Key? key}) : super(key: key);

  @override
  State<AddBody> createState() => _AddBodyState();
} 

class _AddBodyState extends State<AddBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const <Widget> [
            ItemCard()
        ],
      ),
    );
  }
}