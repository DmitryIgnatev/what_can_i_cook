import 'package:flutter/material.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/screens/main_screen/add/add_body.dart';
import 'package:what_can_i_cook/services/firebase/init_firebase.dart';
import 'package:what_can_i_cook/view/widgets/app_floating_button.dart';

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
    return Scaffold(
      backgroundColor: kWhitethemecolor,
      body: const AddBody(),
      floatingActionButton: appFloatingButton(context, 'Добавить собственный рецепт'),
    );
  }
}