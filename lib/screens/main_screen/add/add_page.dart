import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/screens/main_screen/add/action_button.dart';
import 'package:what_can_i_cook/screens/main_screen/add/add_body.dart';
import 'package:what_can_i_cook/services/firebase/init_firebase.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final InitFirebase initialise = InitFirebase();

  @override
  void initState() {
    super.initState();

    initialise.initFirebase();
  }
  @override
  Widget build(BuildContext context)  {
    return const Scaffold(
      backgroundColor: kWhitethemecolor,
      body: AddBody(),
      floatingActionButton: ActionButton(),
    );
  }
}